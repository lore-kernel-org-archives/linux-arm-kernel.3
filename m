Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F052CC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arHEu0aIDNsWIedap3lnQQ6Zb5rdOnRdLktlbu2rz9Y=; b=JMH8j57N5M72D+nnNUIglftlko
	mODCJnZAEIvOS3qw2OIDqViR/5GjZfyBMRzdM7wH+NZbpNZMqg+7aCjqUo9TMC+BkKcaPogu8hPfk
	JO9j3TckWZM/CCgN/Ytx7Q3VFiqWOxCbQgVffA24C7OUZCVTjUSKWD4jbAjJyIB4o2R6e1ZmjPo0e
	zKyFsTPo2d6F+Vt6c3T6sHRP42vTs1P8rEqlyZ6mD9xKtY0TLLP5QxTJWCxJ3zFbxlvrgdkLieiI5
	YeDxoisyRyG5FLGH5FPD3PbXVN3xkvzGyd/mj92ZaoGh4urp1PI1TMdBzKE3NbHLWfDaXFDEPxhkP
	FGKNH1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6fx-0000000DnTC-44Mh;
	Fri, 11 Jul 2025 05:52:01 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6WO-0000000DmFH-0D7X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=arHEu0aIDNsWIedap3lnQQ6Zb5rdOnRdLktlbu2rz9Y=;
	b=P0LR7TvFdASbBQx8TsFz03jiRuVoQS3dUtLb2cv/uajhnoojRzktCTd31j6Pzj
	AsT0S4lz89++TZjJb395jnBXQdLYlGbiCAI0HJ2NGmr4d+oVAHn/Numyarsrju76
	9iIExbv7kDJSEo3vSNJRbPwgYi3R4s5q9EpOmiT+yTp/M=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3Fx4XpHBodJZQAA--.53351S3;
	Fri, 11 Jul 2025 13:41:45 +0800 (CST)
Date: Fri, 11 Jul 2025 13:41:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Cc: mirela.rabulea@nxp.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Subject: Re: [PATCH RESEND 2/2] arm64: dts: imx95: add jpeg encode and decode
 nodes
Message-ID: <aHCkFpTwE2ce-j5G@dragon>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-2-Frank.Li@nxp.com>
 <aG8p71A4/ntuOde+@lizhi-Precision-Tower-5810>
 <aHCjNtw9G7joUnka@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHCjNtw9G7joUnka@dragon>
X-CM-TRANSID: Ms8vCgD3Fx4XpHBodJZQAA--.53351S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUrxhLUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR2HZWhwks47UQAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_224208_421849_44061984 
X-CRM114-Status: GOOD (  10.79  )
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

On Fri, Jul 11, 2025 at 01:37:58PM +0800, Shawn Guo wrote:
> On Wed, Jul 09, 2025 at 10:48:15PM -0400, Frank Li wrote:
> > On Wed, May 21, 2025 at 01:34:04PM -0400, Frank Li wrote:
> > > Add jpeg encode\decode and related nodes for i.MX95.
> > 
> > shawn:
> > 	can you help check this?
> 
> It looks good to me.  But has the binding change been applied already?

Ok, found the binding change on linux-next.  Applied 2/2, thanks!


