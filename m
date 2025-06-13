Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7155C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 01:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YsHuhFMK2Ld2dcwyKaSNTxrpFLRS6RlejH9OKuA/eg=; b=sRdCotf7SvKSHJkC1dT8kPuL5+
	DzWtr4MqiQLkyX4uWW7F2plz18Xr9N6CnUmbqrlXXu9Yd8znWyE1gA4bk2+UgD3BM03j3oGZ2lIHL
	MEw8ROGVt5lPT5nisecftPLDT+rEZF9asUoYCwI1fdsP1ObyK0+GQSGLM0AzAxn1815+e24dN+ba8
	fxxt+n/7Bi5vjTDUzTk8RsnxmrmVLsv0sA+S3Dr0NSxN9A753zMOB4AisReymqyTuTWNQWY4JvPX6
	9RMgY9CGboOFe/Yd/+h6q4fjVBLEcrEw9ypuzifH66pZKYqwkl1g9MUEVEswzxZFAefOocWZKsz9y
	FZDjwpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtSz-0000000F4Le-431w;
	Fri, 13 Jun 2025 01:44:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtQp-0000000F48r-2F1P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 01:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/YsHuhFMK2Ld2dcwyKaSNTxrpFLRS6RlejH9OKuA/eg=;
	b=SAVjJQ1tBeMju1DMkOjVOy3pjosvQPsZfbFEAOZx+cRnHqbiV+y/m5pO4OxLBV
	G8Nw9FA5TsCVis34LPiCVD8CMgMUik8JTZdO0itfFjPzed0H0d1atWHwkYh6IUN5
	HqIRZMHCI6T7PUoopJlJ8hz5+ktjf8ZeAYGRcn06R5dBU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3nzvWgUtoaZmIAA--.34451S3;
	Fri, 13 Jun 2025 09:41:44 +0800 (CST)
Date: Fri, 13 Jun 2025 09:41:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v17 0/7] firmware: imx: driver for NXP
 secure-enclave
Message-ID: <aEuB1qgd6aVl0i7i@dragon>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
 <aEqMSG8k+NpQ7ROH@dragon>
 <AM9PR04MB86048A698B03E974CFD3DB489574A@AM9PR04MB8604.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB86048A698B03E974CFD3DB489574A@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-CM-TRANSID: M88vCgD3nzvWgUtoaZmIAA--.34451S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwVrZWhLXLObUwAAsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_184211_978390_D0DA0140 
X-CRM114-Status: UNSURE (   9.86  )
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

On Thu, Jun 12, 2025 at 09:42:46AM +0000, Pankaj Gupta wrote:
> Hi Shawn,
> 
> To test it on MX93, you need additional patches on top of these.
> 
> The plan was to send the next patch-set to enable the support for MX93, once
> these got merged.
> 
> If you suggest, I can share the patche-set to enable MX93, as an attachment
> to you only.

Yes, please.  I would like to test the driver before it gets merged,
thanks!

Shawn


