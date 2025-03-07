Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D59C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 07:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mv52ohykrXi186nnBA2jtH5FS3TyTdygUkmjJEW2rD4=; b=icSRNikc1xT3/YnMGLbu4x++2j
	X4REVU2KPXcBq45wnGfcRJ4LxEzySMcX0l3MftZOrrLhBhCtOZvKGAo1IHUbpQbZga6KoSUbjc0qX
	oDo8pGjVnaKIXF/GqBUn1oyxUE7Pre7K7jeXBHHijYxA3NW1ivfGfary/lwe8SKyykKnaZIpG65Vp
	Ie7rD0YiQg/eIyG34EDjvHY4EWIwy7rS8nKvaMsFO/nyIEeKGce6IaQukwOiWJ4QnUiQNuNyt/K8+
	EJl6juYJM8g8532mSXMJ+WQX2OKt3hPZUOhdN4x7Z0mrf7gC1nR4KkIYh7hu6OANTSPLefEEGkygb
	hm1jHjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqS8H-0000000DQgL-2sVy;
	Fri, 07 Mar 2025 07:28:33 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqS6e-0000000DQbY-24fd;
	Fri, 07 Mar 2025 07:26:54 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B8CAB25C59;
	Fri,  7 Mar 2025 08:26:45 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRtfGReBau6t; Fri,  7 Mar 2025 08:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741332405; bh=rHjEprSJcpdEoMkrk4oD6J2HzcQmBbR3rYUXuMkEysQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VTs6f9J+r5YfaSr5Jn0gvzobij5DBiIy9KofBPO53N4hhVw3aFrZj9clRqkXitNB1
	 En4gLWWEnyFH4YYL8zI2C8Ld7j3kT9RZy79gfdz/xukvE7mKW2A01vK/5TB1dziu9x
	 /5T5md/c5AunmxsKjQ6+UI7gF3Le8eoDyB2fMjNCGct489+992/RHVpjzSxp+2VYGh
	 S8Y0lROUVenasXWr3tBXWwJm4pQ5ttBg0wCSdhmzil5blWtORZUdZ/BfLB8NEsakck
	 xfBukjJaIIJ2fuZasUnh9XvORSFoK8CnjyF7TB2YNXdc/g7EpIiNAdfKey0UsZH9uA
	 mpbAAp1gtCZUA==
Date: Fri, 7 Mar 2025 07:26:23 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>, jonas@kwiboo.se
Cc: conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com, devicetree@vger.kernel.org,
	heiko@sntech.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 8/8] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
Message-ID: <Z8qfn-OTgopD8YMO@pie>
References: <5a0a7ce1-1dfb-4d19-8a1e-0d89d177f5b8@kwiboo.se>
 <20250307071020.756277-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307071020.756277-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_232652_948640_87978928 
X-CRM114-Status: GOOD (  16.62  )
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

On Fri, Mar 07, 2025 at 03:10:20PM +0800, Chukun Pan wrote:
> Hi,
> 
> > On the E20C the sdmmc controller is routed to a microSD card slot mainly
> > intended for use with microSD-cards and should normally not need SDIO.
> > 
> > What card/adapter do you have inserted in the microSD card slot that
> > requires use of SDIO instead of just SD or MMC? What is the use case you
> > have that requires removal of no-sdio on E20C?
> 
> I inserted an sdio wifi module (via sdcard adapter) for testing.
> Just out of curiosity :)

I doubt whether the module actually works, they usually require more
pins than a simple SDIO bus to function. Additionally, it really doesn't
sound like a real use case for me.

Have you tried transferring some data? The log you showed only indicates
the controller doesn't bail out or freeze when encountering SDIO command
sequences during initialization, but cannot prove the controller is
really in a good state and could transfer as normal.

Again, connecting SDIO WiFi modules to a SDcard slot doesn't seem an
usual case for me. I'll change my mind to keep SDIO sequence disabled if
you didn't get the module really working but only observed the
initialization didn't fail,

> Thanks,
> Chukun
> 
> -- 
> 2.25.1
> 

Best regards,
Yao Zi

