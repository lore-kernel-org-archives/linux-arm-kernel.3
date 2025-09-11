Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C072DCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 03:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/N4P0dQFX0EiNShkkaQjSdBZSD1JMf6VXokKtscJKs=; b=CiMx+jSwIjkLA7S37XoyUO3skk
	PECWDguQmBJr1LcDVaCQ95pdHZFb81Aa0HqVepzh5ITugTuc9XpnU53Hib+N/gOzcXPvd/VSwG5aa
	xrGbejgQ1cHmfF/1L/anB5ZnlZc/pRfyVkwrjrRLJbBRrWku7UE8cNNHVkgst1zE3XH2/PLRjOomh
	rdSETX9KyCk1Gm/s7liF2MImdONFN8DCHARP67QpFVYobDC6iZX3RM6xX/B9IYFJluEx10FjClirs
	hjI6qDnFwcxkXaLs/DYhqs+ipjlVMkYLZwkIqzbDQQqUc0arPcdT5ipKYiZlaLktKHkcTagLwFg/I
	YQoC8Yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwY3s-00000000c4B-1GcK;
	Thu, 11 Sep 2025 03:33:28 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwY3p-00000000c2a-0KZu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 03:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=w/N4P0dQFX0EiNShkkaQjSdBZSD1JMf6VXokKtscJKs=;
	b=bXCaCvHhgaZtl6WnJ6PdFtKTQRLe2b9PB633zfLNNEbjWVQ05sU4IXZp55N7Rx
	PX+bOT/11xj/iJVF8qtIJKwys4ipRNE4WF6dP36ISSh4Z8a/9GQ1MAq5mjgb7bQK
	LO9GB2LzdxqckIKq0rL3YmQSyWYZL1XCpZJlzgMzrIjNY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHddn3QsJo4KJgBA--.47756S3;
	Thu, 11 Sep 2025 11:33:12 +0800 (CST)
Date: Thu, 11 Sep 2025 11:33:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx6sll: Use 'dma-names'
Message-ID: <aMJC91yfcxtSL7e-@dragon>
References: <20250908164431.67052-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908164431.67052-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgBHddn3QsJo4KJgBA--.47756S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUY73kUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgDFZWjB-Squ0QAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_203325_429149_6798FA49 
X-CRM114-Status: UNSURE (   7.81  )
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

On Mon, Sep 08, 2025 at 01:44:31PM -0300, Fabio Estevam wrote:
> 'dma-name' is not a valid property and causes the following dt-schema
> warning:
> 
> dma-name: b'rx\x00tx\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
> 
> Fix it by using 'dma-names' instead.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!


