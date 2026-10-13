Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052F5CC6B10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBLRaGHH3amBrp1ker/5Wm3P1tvMuI98VZU57fGqM6k=; b=PjE/d9gCsWpfaDDXqdcNomdM5Z
	Nyx9wM48oxQPtG3ES2az0rVUFBjHRvv9yowHNRjQUx153MTPL0njp1m3XXUwQ3ePUnDCymcPxHJW3
	mVhPTOLHcd0heMVGIrrenV7hLV1s29x2/Xdh4poTfhZ+N7Z1Amz8fbE9sklWCXELzL2AfWj0N8xYD
	Urz9HJdEFCkc4c72DPfxE0Jd1BXMBiVfWvxT3KqtTD56oOTTD884XBwMC7qvzoQyGmWNKnuawKFRH
	QE16fE0ESjsQMod0q7Q982gK23ObLK6Xsopcrfy//w5ROs8G6LnoN0v22+OLV5WOvZDePSUkGXz0i
	K2m7EdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdBs-0000000D2ef-3OgB;
	Tue, 13 Oct 2026 14:09:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdBq-0000000D2ds-3Sdp;
	Tue, 13 Oct 2026 14:09:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 203C460A83;
	Tue, 13 Oct 2026 14:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713251F000FF;
	Tue, 13 Oct 2026 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900553;
	bh=FBLRaGHH3amBrp1ker/5Wm3P1tvMuI98VZU57fGqM6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=og5cDjPdB/txlT5QRXFShUR51U6MJsvUPagqbrdWP9858xoL+DyCk0bLf+WGce8EI
	 MG6u3fTXg/yp78n0RBvdLuOS6iB8g1+eUD5pBrLCjE+B9Hq14FcoUDdbh9DN8zkg8S
	 RNzSMUBzPaUQJhyGTDiYN3cQfybyW64ITlz8ALE8Ov/sILPDzMIeUwWLjME7FYR0++
	 atWHGjlnu+lLLmgDc3WWMMzcmwW7LrzwTvBBaUGo1nUx0vKXz4PeMrQF4FrZtzPZ08
	 zCzKZq2XcT8iD/Basr81k95xnHx+BOueMWvuAnIqHg9u4+zIGRs2zX7a2OoYYMshg+
	 6QajJ9qCZTiYQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260921232701.3133291-1-robh@kernel.org>
References: <20260921232701.3133291-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: Allow MT6360 interrupt
 flags
Message-Id: <179190055118.3948780.1611547752673476334.b4-ty@b4>
Date: Tue, 13 Oct 2026 15:09:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Mon, 21 Sep 2026 18:27:00 -0500, Rob Herring (Arm) wrote:
> MT6360 interrupt controllers use either one interrupt cell or two
> cells, with the optional second cell carrying trigger flags. Allow both
> forms.

Applied, thanks!

[1/1] dt-bindings: mfd: Allow MT6360 interrupt flags
      commit: ee76e520857352ec34aaa5786db41610a4a25de7

--
Lee Jones [李琼斯]


