Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9A5D3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xQMmLN25d6ur0MTNMIKH54ukh9v7HDdPbHa10LtFlg=; b=RpWxJuTN8UoytEyRscppSH999b
	ElNv4r33YjcnvositeqFq5I7wwoKUE8ES3MrlglKih4c3W3DK2Db71mHWkkpZv+AslgpjGT86AOV1
	DY6iA8OAXTKFUzjBi8/irzHyrudM40+vUOJyu+Jgtlp5Vm18BNHnUbH9HHRizKT870uetEMPFWUU6
	92oTWyN7Q9fy3DHLgXI9yj5TvUOoeW8OiamxlGpBChg2JCDU/WyID7xODSLllNg6aK0MsoUavOMui
	Yiy0yJJEuW5kbBgbTTy0JMxb/Wu0NP4E8N58bMJZ9o3L9xUoj8O/39nF4EsMJpjZKusp/wo62mE+E
	btlRYaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuix-000000079G0-3DzW;
	Thu, 22 Jan 2026 13:27:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuiv-000000079FT-3Tyg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9xQMmLN25d6ur0MTNMIKH54ukh9v7HDdPbHa10LtFlg=; b=DTgN+E4LZE+5v7wLy4BmQ6YXn5
	i8sydyP9uyRp/c6HvlX3Nho7/GKYJ4oR2R6GeF1y4Ru3btI417hOhvvf3UKPl9yZ5Fc3bm32CWUKL
	Q+miUq5DI2M0joGjRO4V4Sstu7HxTFogBP6X/AcnfSCIS1CQelSupxLvRwgQANzmNM1Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viuik-003yWn-KU; Thu, 22 Jan 2026 14:27:34 +0100
Date: Thu, 22 Jan 2026 14:27:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: Bo Gan <ganboing@gmail.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock
 sampling control
Message-ID: <d010a6b8-5bf0-40ff-8e76-18362a238d50@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
 <0d54ddca-9270-40a5-aa82-d8a7b65027ff@gmail.com>
 <1a622916.2d28.19bb105feab.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a622916.2d28.19bb105feab.Coremail.lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_052745_869760_13A4A63B 
X-CRM114-Status: UNSURE (   9.70  )
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

> We also intend
> to upstream complete DTS files for EIC7700 so the bindings can be validated
> against real hardware.

I suggest you prioritise this. ARM-SOC is pretty flexible for
accepting work in progress support for new SoCs. All you really need
is for the board to boot to a login prompt on a serial port using an
initramsfs. So the .dtsi and .dts file can be very slim, CPUs, memory
and UARTs.

Once you have that merged you can work on the other drivers, their
bindings, etc.

As Russell pointed out, at the moment, most of the code you have in
the kernel is unusable, so it is a candidate for being thrown out.

       Andrew

