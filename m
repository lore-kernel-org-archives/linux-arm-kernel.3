Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48B8606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n0dY4Ac/;
	dkim=pass (2048-bit key, unprotected) header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=dB5SYKrb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=; b=n0dY4Ac/RrECWi
	nEZ5R5Wdo3CLa3pOKVMztdNdprevvDlLrPsaQTBAhTvr3004WqxXynBcSP4dRjCR2N9sU3z6HNJRG
	7JlKoHStqPIEE9GTaYYqyWA3Ly2NE4tqVtpHb7q2+4ToJgjvb1H++0dYNoo90LQeucP+h1XzqMZZ0
	efDX/MghKbHv2K+a4c8FpLwfeQf+TMBNVznMzmPylxFy2FZQzfRbVYI1IvfrAlCG4TChrQ3xfA70c
	AyKgLgXFSIUnpx0WzliaHV+0Vy5KC4xgS92ibzQS3Z/nUb21tyLL/VM4mttz5SaOjlLRGGJKuUfZA
	KFLbP+V+Wb1JTIABAriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnuT-00000005k0c-41PM;
	Tue, 27 Oct 2026 20:36:41 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnuR-00000005k0H-2Dm5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 20:36:41 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso507066eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 13:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793133398; cv=none;
        d=google.com; s=arc-20260327;
        b=R8803WBQuYrReiPZVgOKU4eE6byqZDDDoQK6SeuoKmtZPrb6Axppc2RX2Egu9orWSp
         smyE4ereWKdl9FqACkVMAmTI91tciQnomWaGe02o/IoZaPKSQ4EFn+O+J/tOodSeoYU7
         wld3ZuiqFVa5MxIiWx3Xihywv1GZqzreNHkwP7bWT3t2PmqEv38H9J1kfxbU9Ji8NfJm
         d9YWuBji5MdcnS42dkaS4MbZWQdzIjwuKkqUKpZXlVoNTEPQuopVMDboI3i9vs33CtCu
         ejlKc8b8DW6Z/Xb0F45LtmlFLRdU3LTfh6p7xA3ICXsjX8pTtBho80Xnf7s0SyZDAR/b
         Wm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
        fh=mZOP34P6qAMYMlgbOccyzb2Vtw5tctMs3dIQ3LlU+Dc=;
        b=K56h6iTa8XFkIsPRCHZLy+AxIcXlvK2k95FRWaAeQxGUtSGBiHC+JWKJXrIFWFzGUF
         8YYaSr8C5MB35NkIB0u2rvdaRV7uaubdsRXwpS6KTeh0tReEv5vXxlf8TZJaTOdn8yYU
         OxxeD4TVLPdL+fbfhS5yRxGiRF6h0WMFUvlniifHBPZ95k03v1wiwH8S35dNVJOtU8N2
         HMp1c9lR10fa4N16g/kUtxemXUE2I5Wzhj9gBlOvnEeqdil36nvGjAgbpVnHJzioNmR6
         Lv2LzH2gqqcznCIrJHOPsjY9tKlY/7iZTHqY4aFcL6AGTHPg0DtHsREyhfZrELT2egxl
         +AvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1793133398; x=1793738198; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
        b=dB5SYKrbx+FmRcdvMGT2WDeu2PlRO2o0I8VUeDGH0KrODuLW9aXt/PbPMj/cZL5ZQD
         AXmXdGW8dLxuqMu6t1Ue7CcTmJS27PxIlgmtTTFH6v7nuur/dOgOLYpBk7Vm2r8aTDY6
         XabSclQJWz14xm2xjZ1jE62uiqFt13AxcLUSvwuP/+9e6AZ1vXd2RIvS01zy6QY74zy/
         xfeS/kgIFTwAgM3hkQSQCXPKxa5BINz40weOAjg1ByNJqO+FOD/A0RkUhaXQaU3FPlbw
         A5JLlvD4mbfKKTOGX9TU84qCvkyoSyTig39Od0TBLbapcDej7cn2eF2F+fp2jfKmVQbE
         FBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133398; x=1793738198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJungKwd24xGzL5JYcor42TH/xTcUsIKYpqSbdP6+gA=;
        b=BjIZlQK5ydWabH7gZTuLyuZ+nIcsFW2GEBeRaChMdMzqelVyvaK+o1XI2LM+fVX/zI
         UdeJJb6jUbKYRHkzvvqNz3Mh2JUayzS0fPSMfwfh50JVa80y7FUPXoiuR+jkjfjiswML
         kNmNWFMapv7G2Ftyt45ENxplvAbUf81wSzqd5sstMpE8j8VZuYfjP0/XAu/sAc4EcQlZ
         EjuTSFZErVLujIVUQ3TjyaHJO04Z/bwGNryXbYYCUV/o57LZL619a4vxgBOAXbtD48kp
         1yQdl5YsGaZXewDNABu/hHVjO79j+bApiukrS+aZ6CvAmYE0NRoc+FpuAiz4Z4YvdLVg
         9z6A==
X-Forwarded-Encrypted: i=1; AKwUvByoac8kRArIOq8UkMCA3VaDzxkQVk+2TaL7Etylt2XBbM9fwpJFr4vXzFmtxqE1f7PKku68nnmhwebVQjk5mM+H@lists.infradead.org
X-Gm-Message-State: AFq9FYI4RUCb9xPKjWQWTEg1ryHj8fIPixlFP58LwKwR+UNw9K1Dmnc3
	pxUJCTnaPxesDW01YVZ44PqA6/aOp0Dye9HD0aLClOYMrv3ExBrnYv3ZFODwNmoM6YZtOpbgp1n
	QU1A8JZ02NUtVrkyLOWGo0Ey0NmBQ/Vwz4lQC5c62rg==
X-Gm-Gg: AYBFou3Fcv1O9WxCJywMJEWI/3sP6dJfdcFTUEjy8i6puqbhGBXW1ujwR3SGdIC71Nr
	j6gzGvdiyx/avHghtRYHRbDR+IHKKT+5JEDm95Uzsa5YsRIXpEjBoeaCuq18wCX60zIHsZm4TUq
	Vs02yvhdYZ70FvJI3e6Vp/xMu3w9fD1eVxyDIsIl+mxf6226+1HS/6jRi0E/Jd3jgsVLw19cAR4
	wK7gWPGB1b/tGFZdb3qTUUCVb1VGg8E/xhMedpQ+8E6zGu2Ro3uKWZLMk6BgW04G4WAc48xOcx3
	IrNl2DYBKriHmm9ZSQnlpId/pe7vrvGIXPM293HvEJQhdToYbvlmddX65K8ZAfd6ytedGWtNlxc
	DUD7PkYPNCkq4FL/W0ymtiQZ9RvhoGy05ObzssutnEkaziTUTXKgtfao3NTVKZg4qxn7ashN0f5
	rmqae/AaECJc+KVuucY0+0L903K/hjfR8cdgSuFU2kh9KKrkhEAMG9cmw=
X-Received: by 2002:a05:693c:821b:b0:36a:1294:59e0 with SMTP id
 5a478bee46e88-36a20179d20mr630828eec.24.1793133398014; Tue, 27 Oct 2026
 13:36:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-4-20faea2e7a80@nullptr.com> <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
In-Reply-To: <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Tue, 27 Oct 2026 13:36:27 -0700
X-Gm-Features: AclHuK_MdLe_77m-KmkFSnccE3-4pezFMsWPScpQmmJScc5U5CiCCI34Cd6wgxQ
Message-ID: <CAHnw2UkB_KTh3c816SUUgaH=SenFKOpYwvaMvowzi-O5oFmCyg@mail.gmail.com>
Subject: Re: [PATCH 4/5] dmaengine: xilinx_dma: Withhold an AXI DMA engine
 whose reset did not complete
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Suraj Gupta <suraj.gupta2@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Alex Bereza <alex@bereza.email>, Folker Schwesinger <dev@folker-schwesinger.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_133639_672833_BE748093 
X-CRM114-Status: GOOD (  14.37  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In theory. I haven't seen a reset time out on our hardware. Every failed
reset in my testing was injected with fail_function, as the cover letter
notes.

PG021 describes the soft reset as graceful: "Pending commands/transfers
are flushed or completed", and the Reset bit reads 1 while the reset is
in progress. My reading is that a transfer that must complete needs the
memory side to respond, so a stalled interconnect or memory port would
keep the reset in progress. The driver already allows for that, since
xilinx_dma_reset() polls the Reset bit with a timeout and returns an
error. It just doesn't act on the error: xilinx_dma_terminate_all()
frees the descriptors and returns 0 regardless, so if the engine is
still fetching, the next transaction reuses segments the engine owns.

Patch 4 may be more than this series should carry as a fix. One option
is to drop it from the series and post it with patch 5 as a two-patch
RFC, scoping failed resets out of this series.

-Jeff

On Tue, Oct 27, 2026 at 12:22=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Thu, Oct 22, 2026 at 03:11:33PM -0700, Jeff C. Jensen wrote:
> > When xilinx_dma_chan_reset() times out, all the driver knows is that it
>
> Does this real happen? or just in theory
>
> Frank
>

