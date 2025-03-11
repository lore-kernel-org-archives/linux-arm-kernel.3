Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88D6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+N2IxYKhWhCgu759Fk/3682pL7HCnhuGXvgrgMUfEM=; b=Z0MmtC3o/YCy8zveWjmyJIxbnI
	aaAuzugrsc/XI2T6UAVFDXvGQiTFP8u6iLdJRvJVuQT+5VxDR+8jv6cKrBvvqzH+bXZpHNdUfdCfK
	rws4UEYiTh/buizdW1A0LaVOYAqqMrnNUFLZbHTY1Aztw6MD4TCTcax6ZB92JGRcNTtGeWJ5Y1+kO
	rYk3wu70bL6jLzzRX7qnEPcvwS9I3pztwEC7qwEJwjvfqYStNumrVxeW78eeRlQ8JThpcGSUf5pfv
	7VfGasv1s9ZLKPuTnWkHGi3N6SKnsF/rZPOk5iwEHiAKbU/qf07SQ6CXb74MzzvJsBevebbjQWcx6
	qJhuiq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trotd-00000004Nrb-3puH;
	Tue, 11 Mar 2025 01:59:05 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trorb-00000004Nh9-1sKr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 01:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=A+N2IxYKhWhCgu759Fk/3682pL7HCnhuGXvgrgMUfEM=;
	b=NALJTLrd4p3w3R9kRP01xNkyhxlQk3WW+cH9vgWMY+gTLylQsVLgSMRulzPEBI
	Qwzr0qa0nxwBGXBWW1qS8FT8OHDgQs76v1i4NYS09BjWaZ93QrH1Ugw1kTby4Hvn
	wSzoantPOWgncVdZiXZXmJ6T2gk6UN9GEO0yFAIOewueA=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnN7FYmM9nHtCuAA--.43218S3;
	Tue, 11 Mar 2025 09:56:42 +0800 (CST)
Date: Tue, 11 Mar 2025 09:56:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx31: Use nand-controller as node name
Message-ID: <Z8+YWBqymWyXISBD@dragon>
References: <20250220130345.2375204-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220130345.2375204-1-festevam@gmail.com>
X-CM-TRANSID: M88vCgCnN7FYmM9nHtCuAA--.43218S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcWEEUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxINZWfPUl3HSAAAsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_185659_837515_553194E3 
X-CRM114-Status: UNSURE (   8.67  )
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

On Thu, Feb 20, 2025 at 10:03:45AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to mxc-nand.yaml, the correct node name must be
> 'nand-controller'.
> 
> Change it accordingly to fix the following dt-schema warning:
> 
> $nodename:0: 'nand@b8000000' does not match '^nand-controller(@.*)?'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


