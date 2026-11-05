Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2994E606CF90
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LBjshcs+;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pn7Wglhq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/cWlRZ8SCFwTMb55OqToMLGSlbLAYefJerAulPP2VEQ=; b=LBjshcs+AgndDpEv4nKJY2ODRE
	7yqG4sQOg9wQSOtg17fxHciLrli0ql9BVchw6n68Sm6fTFp+tAJvs4sEmDuDh5xMzlwTxlc3banP4
	EhCNOda6SxWVSXNJS1jCTFvbMp9l1vq0USmeI/0DkCwqMRXSAhiMt1qyFuNNIkeLjUg8rcFQagNPs
	4Sbey5ELy5ajvnTnE7iyS7k0m4Urkm7ajxbTUq39fzuJETDlV9KAsdgobtqd18Epr1DNrJGRXFNqz
	BbSsnltVkGUzpaztgEQiJJc5W0wz649UwRrCuoAiPBlh0rSwrSUNSf0rn53uIipVKHJN+saa0Lsql
	0YAYGJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzyr-00000009Y2X-2nLJ;
	Thu, 05 Nov 2026 16:06:29 +0000
Received: from out-21.mta0.migadu.com ([2001:41d0:1004:224b::15] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzyj-00000009Y1K-2JfQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:06:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=q1Jd3oCj3wElY/Ramn8yIWwh5Mzi3hHTvnQWrqt1nCM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793894774; v=1; x=1794499574;
 b=Pn7WglhqBntRYHjdsQbqRKyn7lHBPxai6iNEYbabp74BJ0buTkHTvlcRsdFYufNFUBCZ07ha
 gR0aM2pCLAKCkT4oXTKrbWA3gGB8l4Ctz7xVtC/wLRmglYS4m3MlkAfjemeI+wYcI1vKCkv1N1W
 CeNntVi3a8pq/wDVMBt6LV5s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id beac4f34c3a6bc1b;
	Thu, 05 Nov 2026 16:06:14 +0000
X-Mizu-Trace-ID: beac4f34c3a6bc1b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so9902e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 08:06:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxVdP9Y4q0XYPPML9pORk2uhycpUPL0M3XWLoTCIOfzkGEayRXE0p+A+lNx4dSecIIMrmjEc4cewBscMgph1tO2@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZIs2bi7Yqa84uFrGMb/P6dZRtyNLiSEgU7ytnDRQSYZUdOvFT
	RQ+wdp5FAVeqFb61G8yFjGBD3zjSFxhkD6ZEGwJMNniFcMSTX997vKuOxTmVqqrftkWUOq4fLF/
	4QV2C2MwYBuL0Fbu0eV48VS+8N7mGbvIoSZKvQlhJ
X-Received: by 2002:a05:6512:6ce:b0:5bf:bec9:aaed with SMTP id
 2adb3069b0e04-5bffabc3e5emr166519e87.8.1793894769045; Thu, 05 Nov 2026
 08:06:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105110050.1244525-1-fuad.tabba@linux.dev> <861p8z2s5w.wl-maz@kernel.org>
In-Reply-To: <861p8z2s5w.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 5 Nov 2026 16:05:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyEOfDf4ynYuGz1ejE3s6R2syP4=zZMcq1oKAqFfDxCNA@mail.gmail.com>
X-Gm-Features: AclHuK9sqVJFjm0gw0BfO1w3RU0O4-fEP04HRvITK947bPe5QzS5BG9idCL7ftg
Message-ID: <CA+EHjTyEOfDf4ynYuGz1ejE3s6R2syP4=zZMcq1oKAqFfDxCNA@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: arm64: vgic: Drop stale LPI pending state
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andre Przywara <andre.przywara@arm.com>, Eric Auger <eric.auger@redhat.com>, 
	Yuchao Zhang <ndaugoing@gmail.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_080622_229299_5FE7AA4A 
X-CRM114-Status: GOOD (  14.89  )
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

On Thu, 5 Nov 2026 at 15:51, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 05 Nov 2026 11:00:47 +0000,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > Hi folks,
> >
> > The GIC just keeps on giving. Three follow-ups to my LPI fixes for
> > redistributors with LPIs disabled [1], to fix pre-existing bugs Sashiko
> > found.
>
> Can you *please* come up with a full series rather than this constant
> "here's another set of patches" that address the same thing, one
> pothole at a time?
>
> I'm now really tempted to drop all the patches I have queued on this
> so far, and wait for the "one true series".

Sorry about that. Every time I think I'm done with it, Sashiko pokes more holes!

I'll sit on this a bit more, make sure all the gaps are closed,
Sashiko it locally, before I respin.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

