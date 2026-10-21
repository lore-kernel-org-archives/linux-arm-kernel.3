Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4B8606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3F2iScnZ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZkZ4SxUw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6r9UhT0HEFK6UfPUuCuwD1iwb6CoAylgybqtONDCEE=; b=3F2iScnZRtAG0Tsc3CHD6tY636
	xFekZNy1o+WIn2oX4nbMNQf4LoRSLMktNZuGtG06NYyGC5hwcXOTgAlWClMImZQA+HS3j3YsKya9b
	fcERQ5JRTk88CidJAfIatmVHG1G/M8dV37L9vTuLThydjbh1wI692/Um3jbgb6+Xrfx8AsJZOjc2S
	KCiDYCzXcKNnNxBmXVT5s8E02fD/vBS0lSQrA8d33zApMGC8sNpLEbhaAEqZIODcg9UrUELkCGgaD
	FDVBPC2QmoJvJjV35RfzHCO4dyI8y9NRKgPrU+IcYE+4Rp6AnUci4rnYcAM6dRQAi0pb8HTe9MMXy
	3FAbl3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVCH-0000000BmH9-1uLV;
	Wed, 21 Oct 2026 12:13:33 +0000
Received: from out-65.mta0.migadu.com ([2001:41d0:1004:224b::41] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVCC-0000000BmGc-1pqA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 12:13:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=C6r9UhT0HEFK6UfPUuCuwD1iwb6CoAylgybqtONDCEE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792584804; v=1; x=1793189604;
 b=ZkZ4SxUwP69MGeWzu4BL6L8OHTn28FqTkwQhPbjK4bKolv79486ybSc4XLzrd+p5pAnMtNNn
 Ea7mzh9HrEkPcasox/4nVe0AgE9Hwt650A+Mza//MYRWedAEQ51I3UmdgqaK7VvE6cTzJMlhmP7
 vQxzpAJOs5Eb2RhQTYyCF0nU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f5da5979c3795bde;
	Wed, 21 Oct 2026 12:13:24 +0000
X-Mizu-Trace-ID: f5da5979c3795bde
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8783e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 05:13:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNC9UWEr2PD/3DOoQOqUj+lfv2WLgbRjTQiKbah7Z9QbEEtBj63vdlXAAeyAXB+ev8WF6iLKqExA+NpQvYpjw5@lists.infradead.org
X-Gm-Message-State: AFq9FYJoMZ4OkYgSroA6jG54IVZBBS8X33vTogn1+/bXMbaLBcKh3xjF
	Pb1O+ZhlharzjYh1n9TZs9jXgTqcD7zvK13CvSNMa4ZkmoQBPZVQLIiI8G4ezpJMvpuZgrZQiuo
	btH2Rq9nG2D6RkwMchNv772L6133pdyYSdVBRH8eR
X-Received: by 2002:a05:6512:3a91:b0:5be:362f:27b4 with SMTP id
 2adb3069b0e04-5be66f45d0emr297020e87.7.1792584802992; Wed, 21 Oct 2026
 05:13:22 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021110000.508827-1-vdonnefort@google.com>
In-Reply-To: <20261021110000.508827-1-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 21 Oct 2026 13:12:46 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzHFpdR0CD0e0MBRenhci614qVEz=bidKtszqKRoqst8A@mail.gmail.com>
X-Gm-Features: AclHuK9dxoyuqm6J1yx8Oee_PPPZNymPFmNEb-zW_eag5eTNixeBeaxaZ8hZ_ug
Message-ID: <CA+EHjTzHFpdR0CD0e0MBRenhci614qVEz=bidKtszqKRoqst8A@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: pkvm: Clear GICv3 LRs in the hypervisor
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_051329_495944_5928ACEE 
X-CRM114-Status: GOOD (  10.86  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Wed, 21 Oct 2026 12:00:00 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
> The LR registers are architecturally UNKNOWN when the CPU boots or
> resumes. However, in protected mode, only the used ones are reset.
[...]
> Cc: stable@vger.kernel.org

Could you say in the commit message what happens to a guest when an LR
isn't cleared? It's what justifies the Cc: stable.

I tested it with QEMU modified to leave a chosen value in the top LR
at every CPU reset. Without the patch, the guest took a spurious
interrupt when that LR held a pending interrupt. When the LR had only
its EOI bit set, the EOI maintenance interrupt stayed asserted while
the guest ran, and the guest didn't print anything in 150s. With the
patch, neither happened.

With the commit message updated:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

