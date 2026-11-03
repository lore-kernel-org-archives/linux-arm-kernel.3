Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EFB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vjN8I/tC;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NsteG9Gz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zOCB2yW7H1L7hqWLuRwpPyC8dh+ZZPOknwvDqx+RYXc=; b=vjN8I/tCtriteUaTG2aFa3z8F/
	SU+iR8pnWeq2fHBx/2hEW9xp4Dm0Z2hMNk6UNhoXNZdD9yEv7HdEjCiII8enjpusycVaLTgcx0/1t
	n72zS01WigTQGTR0+eJNHDzhMaNskmd7x88LIi+um9c8qQbbNx/x2xsuKREHVVGM2USsIjAam5CoA
	NmX8q2ML9oD5JO7LP9lh2vSayv5SL2AhGHhffMF5PoxbCO4J4rIqCqYm0koX8PABjV1jrdoQLnO2V
	QViH0FaTvUUR3JxXmDHRenRTNgZFABiBQSsarMTrhitpErSQu/zsgLJXZ85siLKa+5GbwqX5QnujP
	Qm8GzqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGyJ-000000033MV-2gME;
	Tue, 03 Nov 2026 16:02:51 +0000
Received: from out-169.mta0.migadu.com ([2001:41d0:1004:224b::a9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGyG-000000033L2-25zr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:02:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zOCB2yW7H1L7hqWLuRwpPyC8dh+ZZPOknwvDqx+RYXc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793721766; v=1; x=1794326566;
 b=NsteG9Gzcn7zHD+jjLMI3L2qzQcem/kKHW5hgVhjZZ6NSIn1Hk8Vc2SYL+Y8XeeWXsByi6Jm
 O8mlH/6aP+DYNFxpDwiTNwZH0aw+p5JkZCXj0bAod9ZY39NqEmKKb/CEv4keI91G1FCEhaMGm4k
 p17nAutfSkmplVBD63YAXscg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a8d63ce36f623505;
	Tue, 03 Nov 2026 16:02:46 +0000
X-Mizu-Trace-ID: a8d63ce36f623505
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so7472e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:02:41 -0800 (PST)
X-Gm-Message-State: APuU4Z95QmCPjTB7YLjI/Pr1JkqjVm3maCGJl1iDQJyW+f6GAldYfNRi
	GErtj1sP1NBSzcnAK9iXE30OeQXyoev9yI+Y0jYFVefKIp3bYmcmY+qEJID7z9Jt4g6Xmvc6h6l
	72lR0ppyy+Fto/3eV0DQXOjYNrw+ZJs34FtmmxRDe
X-Received: by 2002:a05:6512:308c:b0:5bf:f368:d60a with SMTP id
 2adb3069b0e04-5bff368df88mr6002e87.11.1793721760355; Tue, 03 Nov 2026
 08:02:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102194454.4086911-1-sascha.bischoff@arm.com> <20261102194454.4086911-16-sascha.bischoff@arm.com>
In-Reply-To: <20261102194454.4086911-16-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 16:02:03 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxFT2AeAj-hvuQW3h+u7p25wVpo9CA4QZZrayQW-KOBiQ@mail.gmail.com>
X-Gm-Features: AclHuK_ewwkMxYhH2NmdYQ5NcJFK1vnOJxwlqW6fDvbpSmhufUmI6wkocmqxpCo
Message-ID: <CA+EHjTxFT2AeAj-hvuQW3h+u7p25wVpo9CA4QZZrayQW-KOBiQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] KVM: selftests: Add VGICv5 ITS translation cache tests
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	peter.maydell@linaro.org, lpieralisi@kernel.org, timothy.hayes@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_080248_706389_51F13B48 
X-CRM114-Status: UNSURE (   8.68  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 19:44:53 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> Also cover negative MSI paths by checking that KVM_SIGNAL_MSI rejects a
> message without KVM_MSI_VALID_DEVID and rejects a message whose address
> does not target the GICv5 ITS. Finally, inject once before guest-side
> ITS disable to prove delivery still works, then have VPE0 disable the
> ITS and verify that a cached KVM_SIGNAL_MSI delivery is rejected with
> ENXIO.

The MSI just before the disable is expected to be blocked (IDR1 is
narrowed), and the disabled check runs before any cache lookup, so the
final ENXIO doesn't test the cache. Could the test restore IDR1 and
deliver an MSI first, and the message describe what the last step
checks? (Sashiko [1])

Thanks!
/fuad

[1] https://lore.kernel.org/all/sashiko-outbox-194181@kernel.org/

