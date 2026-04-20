Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7FBF588CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNIYCAMzw62p1IGwSngcgeqRZ5SaZxl+3Vcyiow/Dk8=; b=PR5Hej21jBVWLCATniSyScc/gw
	yGs6j6m7Z9nqJOxWGpGGQyXekvVjLGgT8QrT4nq7juYmev+rCeyIXZhsUCPHYApigRUEGaS8uI1hA
	Y6rrw9LqM1YAuZjNWFbzSijdvScy6YdHdTjzXMNG7mEcf/3zbNNXWivpXhazcO7GPpM+C7kcFlz5q
	JXoV+IX3Wy5qn4vlYGw7Imekw73CU0rFVc8gBLMzt2kp3zQazTN5CBt7kvu8tlkk3/MVezmHr8LZx
	ReAuJccos8qa6D684hfDXXu7DzIK1W3pIoF0gvyjbxVwOr0veG7P7OFnWDVtuy+GkBDQYx4yEj/j+
	5iixvJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpHl-000000078rC-2RXt;
	Mon, 20 Apr 2026 14:07:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpHk-000000078r3-2Y4S;
	Mon, 20 Apr 2026 14:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C71C560141;
	Mon, 20 Apr 2026 14:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD59C19425;
	Mon, 20 Apr 2026 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776694055;
	bh=d80QDEnxF/ilpFms2KfQO1UNLF3wo4wPPu1B5+qU10o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2Wb67bqeB63dy4hokMUqABHv9VGNfMqKSK/q1/tAXRpen3mpHhP93s0Ag0Aokafh
	 weU1wnR8UDgRJYke/yAJLQtumXxCtuVELwNr4AC86mjMYnI454BGXmg4OwurXq9wni
	 RX62PVCzhG0XdwT9OF/063G9U8AbRG2qBjvwo8nMnXwRYrE/FTLbJZNBEfmHQ7eKXY
	 HILp2bgoRGP4oArlsX2frM8fa9xaQEKTc567Hbtbl7WgrtRti5bwZtaLWuTDbyaMRm
	 cVznFsS1ZmW+B3k5KkZAQ6qxI9OoCxD2oR6h06qp4WPo5nlNDCViiNJszT//lNT1Uo
	 An5H/uCq9nQ7g==
Date: Mon, 20 Apr 2026 16:07:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: rng: mtk-rng: add SMC-based TRNG
 variants
Message-ID: <20260420-flat-rook-of-hail-bbede5@quoll>
References: <585fc832e4e5d3656bd25ecee6bafb636993104a.1776600269.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <585fc832e4e5d3656bd25ecee6bafb636993104a.1776600269.git.daniel@makrotopia.org>
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

On Sun, Apr 19, 2026 at 01:05:01PM +0100, Daniel Golle wrote:
> +    rng {
> +            compatible = "mediatek,mt7981-rng";

I asked at v1. Reminded at v2. Nothing serious, but repeating myself is
pointless and kind of waste of time.

Best regards,
Krzysztof


