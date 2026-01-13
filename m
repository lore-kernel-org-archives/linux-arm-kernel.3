Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2DCD30CEE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 22:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gn55x6/YZ4/slyCsrh5AT6hhmEgzx3mWUMl3XlI4UJk=; b=MCvbRg1b/mUbD/lMWcRKEgCLPb
	gLjQStb3DouSYiE5KbKihNRscFsfIq/va8aqPv5Ow8jIvFkS29hVX3/Ufz9h+AZw8XAvt4i9Lxgm+
	zeh5Zul5oguGZciDrQX7en582V4VAf6Dhm1xRfDYxHdv7nyTSW/ZbtZy8XRVm9WK7Ws/J4bw56AWg
	uzIygUqcRYVvUOcFdbKJ+1ePkja1mJzXoCzTyn1sF6SiAiV1loiGairKJbISrpy3FuWLz2WpRPYBs
	p9fb0YIR4mcfVm93o0sOUqMm/oGfI1WF2GKdpU5sYcFz++Zs1buaPqc+wGNhDsNSPwEzx5xrBQIyN
	aT8wa2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnGo-00000007qbN-0LOY;
	Tue, 13 Jan 2026 22:53:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnGl-00000007qb0-3Ojd;
	Tue, 13 Jan 2026 22:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A5E943621;
	Tue, 13 Jan 2026 22:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDD9C116C6;
	Tue, 13 Jan 2026 22:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768344827;
	bh=2MHv5Sgc3pFqXVzbcr112eYhr4dz8zmnuSF9FChDKqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eDqGCxraARN2E4kq9xiAODfNysntzYgLFvVCreFPo/qN0DvAqziIxJwnH5briFYcq
	 DtZg8c0OBejyMyBZR61bDYz+gMViYisessBIZn62p21dHScGPcHsy0saZwlfJxtMgB
	 Q5EEGXKgy2/OtH1EjvdvvGzyLce/0radOLE6Hrya6bnJdc+670c1yJb9UmRv1Y3mYq
	 9ik0mXibfa82PYbau9buuGRe1dwXPlfDHczLjrQTiqsCDHo7DN4jm1ft1Ij3hUpuBP
	 f+/gWYdkl2h2mAJcOeqp7R1niAyPqm5TZUtbC9iYzWD5EdOFbb55CdPNlBLfeiENy7
	 MvV8u58hsgx6Q==
Date: Tue, 13 Jan 2026 16:53:46 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: Allow single
 vdo/mmsys endpoint
Message-ID: <20260113225346.GA367211-robh@kernel.org>
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_145347_875911_4EE8EF47 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 08, 2026 at 03:39:32PM +0100, AngeloGioacchino Del Regno wrote:
> The hardware supports using just a single output while leaving all
> of the others unconfigured (disabled), but the binding did not
> really allow specifying a single endpoint@0, because in this case
> one must either:
>  - Call the subnode `endpoint` and not declare any address and/or
>    size cells; or
>  - Call the subnode `endpoint@0` and have at least one more other
>    endpoint(@1 or @2), and declare address/size cells.
> 
> Allow specifying a single `endpoint` subnode, without the `@0`
> implicit suffix to suppress warnings happening on this kind of
> valid usecase.

This series isn't needed. We've dropped this check from dtc. I'll do a 
sync with upstream.

In any case, it's also a W=1 warning which wouldn't be my top priority.

Rob

