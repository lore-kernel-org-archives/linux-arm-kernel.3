Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90811CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAs9F+xYu7ciu6YOpuijDXXwLkud1o/P82ldiFiTdzE=; b=jkHukM4okTM25jV7LRdfE1oFdo
	0HpN3UQ6AAjSSGsvFIFbdOMeMQM+K57DGSIvMAbl0cNE2CI4FFizB8nG5wny6bwjOcV1Q5513x8s1
	Px0dqwqDygHs3sJQqOLrtZu5d1Zdx6s8a78qpLMvgTEOWAI6jYXww7BlmMFI1sSzp1aaGSlowXtYq
	u7VTX+orH1Cs7wsPK6t207ZsvstWZeoKDlMSK3hC/QpsIlDUDOBjDLDU5IeRoX1t4iuHfCh8qlgl5
	QiZqF8sbSebHQWkBnkso7JPrYPcnZOIKmtgbvWi7evu2b06nJOzCFJ3Pwb3fSVASr/tySQ9uLLdmZ
	MEzpejBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqo-00000002I5k-3BtU;
	Fri, 22 Aug 2025 11:22:30 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHra-00000001JgV-3J1M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 02:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ZAs9F+xYu7ciu6YOpuijDXXwLkud1o/P82ldiFiTdzE=;
	b=IuSm+NfMl5Q3anJ+COm7Un2utOP989WB8doyEr7JPC5HtiLHVDF7ErEk9Udgib
	O6RN+nTBw6Mld0EXbV5s+PLfOlw70zEsQeoa3owb95+/Gs5bEXThNlA2FBmCzllW
	tF7pI6EYZuJtQ21IHhItllg9zmSrycMAxlmOqpqxL7U4k=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3Zdvx2qdogHskAw--.15069S3;
	Fri, 22 Aug 2025 10:50:27 +0800 (CST)
Date: Fri, 22 Aug 2025 10:50:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH v3 0/3] arm64: dts: imx8m: support more sample rates
Message-ID: <aKfa8eHje2642O9r@dragon>
References: <20250815102317.910014-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815102317.910014-1-shengjiu.wang@nxp.com>
X-CM-TRANSID: Ms8vCgD3Zdvx2qdogHskAw--.15069S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwmiiUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxP2XGin2vOYNgAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_195047_182495_660F9C87 
X-CRM114-Status: UNSURE (   5.55  )
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

On Fri, Aug 15, 2025 at 06:23:14PM +0800, Shengjiu Wang wrote:
> Shengjiu Wang (3):
>   arm64: dts: imx8mm-evk: support more sample rates for wm8524 card
>   arm64: dts: imx8mq-evk: support more sample rates for wm8524 card
>   arm64: dts: imx8mn-evk: support more sample rates for wm8524 card

Applied all, thanks!


