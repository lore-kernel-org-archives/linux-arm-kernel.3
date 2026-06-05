Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C035CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7y2qdW5Y46qla434jE+ACDcxuUp7VYaUzScisOjV1M=; b=llYQ1e1rNiIMj79rieabvFw4Ls
	UlLe/gglGRMqwCx0XJK+WlL+lVPiXQ7YHp16OITdkyR9fuMGDw4FIkxvU30ubhMMy80kMbitHKBxA
	xaj2PUvLLhXYGZewHfAfc8G8QxEDJO/EzJzUn24nhrVWJeJmb/tXzniGeZV6jEG6f+5wfLkzrhEhD
	TZkG2DDwPS/61NmhNPrSoPRJVVsermFUsrjvxjexo5Xgzecqob8W6JukkmylyvfIuV179Mq3jrFJb
	Gyxf0WeXofLxZntwVYaNMpcZsLtXdJu2Rf/KN+cOdRUGqceYlQ34peueKx76DfJgqL6I+0T/yk9SB
	MDwzSXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRa3-00000000T8n-2zWE;
	Fri, 05 Jun 2026 10:15:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVRa1-00000000T8U-3Mss;
	Fri, 05 Jun 2026 10:15:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41D78601DD;
	Fri,  5 Jun 2026 10:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2124B1F00893;
	Fri,  5 Jun 2026 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780654509;
	bh=r7y2qdW5Y46qla434jE+ACDcxuUp7VYaUzScisOjV1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F82/u//5JDX2dTDcRFEv9je27+ld+9WY+9ZCskT7v2oJXptF382qOUzVClTmsuo+V
	 xeHRgOMpeotK49P6LPZtnH9DZCpKTIkoV9xp2zPH4/JfizCqH3kkc5Py2+r/Hfl5ij
	 iMXNQbp+gjntUH458ZSsJS+vCgTDmrXgY1cBvfXn84kMXV/sDadXvxQDem17HEAUgO
	 yib3mv6czHrFlBXlPtf2fcT85vFWz79w551fanyRDlTVQFsIbaIJWdZFjzOWSt0dLT
	 Ml7+94C0eJn8igOLHJmy/mN3LWuY6/ftO5IyTqCfNXk2MpSanrgeuFCRgbSPVxfuWr
	 ZY7+QTyhcNZpg==
Date: Fri, 5 Jun 2026 12:15:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] arm64: dts: rockchip: add Vicharak Axon board
 support
Message-ID: <20260605-supportive-exuberant-serval-cc42c0@quoll>
References: <20260601162143.170030-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601162143.170030-1-hrushirajg23@gmail.com>
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

On Mon, Jun 01, 2026 at 09:51:39PM +0530, Hrushiraj Gandhi wrote:
> This series adds initial device tree support for the Vicharak Axon
> single-board computer, which is based on the Rockchip RK3588 SoC.
> 
> The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> use cases. It ships with:

Slow down, please. One patchset per 24h.

Best regards,
Krzysztof


