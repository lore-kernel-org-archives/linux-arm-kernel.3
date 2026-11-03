Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99569606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E9MbWQMW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RKf4Bfn3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XDGk/1b1zaqZV7qJByvDevo3UbcM8JCHCc2CfWtcNfY=; b=E9MbWQMW+vvFztGsFDtZcZc/kt
	79M/XBJCXXbPdL9DLEk7VkzernCxWKac0z1in8IizrF8fIhHjZjNKO/eOFCjKZ3Vdve1jblEUZT3k
	CJdPUdhN5iSdx2S0SG828KAeoxDXghHKYBcBhdXE/PP3C+QE44XmNfuCCPUrIIhY3wiHTP58hn8Jz
	qy+Egv7JG8xc19S5sIZ45Wx0ViXXAr7Tm01mmtFmqDqzKwunzYLTUvpOlU5YSKbR3Op3arryoLVEp
	MXJQGOBq5GF73SfMiN91JdcZtIGaJtpaYxeJL2iGz2o/QCnQBx5djSxWVumX/nOkOe97hWHo++9A1
	TKz+2bQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEmz-00000002bTA-34XA;
	Tue, 03 Nov 2026 13:43:01 +0000
Received: from out-166.mta0.migadu.com ([2001:41d0:1004:224b::a6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEmu-00000002bRM-3kzn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:43:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XDGk/1b1zaqZV7qJByvDevo3UbcM8JCHCc2CfWtcNfY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793713374; v=1; x=1794318174;
 b=RKf4Bfn3a5TovjZ3tR0IIvMDKoKKDVZXe2nu89Xx9KwZa3DRajm1MPXBCgjgOQVjRqrcv8HO
 PQqMrT0Pb0zyaDqJjDqI5NE3+BT87/p/OVA588hEmNqgJv3ytfMKT2WcTSKgddF13D7Rzc7Acdk
 4xZdEW2R+lGlZ6WiIXW3Je7k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bceb7aee81a967cc;
	Tue, 03 Nov 2026 13:42:54 +0000
X-Mizu-Trace-ID: bceb7aee81a967cc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so5742e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:42:50 -0800 (PST)
X-Gm-Message-State: APuU4Z96u174zRg5R12WU/+1P4ctbMkIrwrcyFcSvLts68w3klQmRQOZ
	TObDCJWk0L6ed1SnI9WBfmYdzPp7ih8k95uFVVNdk3SJ/KnN3k1u24R6MlS/+pj9yi1QNAT3jTz
	pgkadvk43lkeNsucwNLXatXfObR9QPjb1l7T7aFwY
X-Received: by 2002:a05:6512:2c94:b0:5bf:d10c:ab94 with SMTP id
 2adb3069b0e04-5bff0551cecmr153064e87.11.1793713369309; Tue, 03 Nov 2026
 05:42:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-3-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-3-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 13:42:12 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzqNuuwOp3hXnSZw0rFX1vQAn5HZx9UG=DbiH3VAH=K_g@mail.gmail.com>
X-Gm-Features: AclHuK_Rsw6J4kK5YQayTAqwk7a9tn4wa7atO5obFEHkCeocR8wt7l4zy7C7St8
Message-ID: <CA+EHjTzqNuuwOp3hXnSZw0rFX1vQAn5HZx9UG=DbiH3VAH=K_g@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] KVM: arm64: vgic: Pass opaque device pointer to
 ITS MMIO callbacks
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_054257_076293_14627E56 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 19:45, Sascha Bischoff <sascha.bischoff@arm.com> wrote:
>
> The ITS MMIO callbacks currently take a struct vgic_its pointer,
> which ties them to the GICv3 ITS. GICv5 needs to use the same MMIO
> dispatch path with a different device structure.
>
> Pass an opaque device pointer to the callbacks and cast it in the
> GICv3 handlers. This does not change GICv3 behaviour.
>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

