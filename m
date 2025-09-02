Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDE4CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHhmYTXZV2lWj30LY0c7VICtklAkf1w3iVz5L0hSoCU=; b=FT4mX0s2gTqg7FTNpWKNBSp58Q
	jI2VvnwTeQ28bpH9scMokqy2Wk2P8qyjrf5D1+717ESOxYe8yhI1wrlrTSiSsXGYLgzB6KSdzkR8M
	9Wf+DsQHonN8Polk/kOpssunQ5pLCQdmgLhnpAuyXaYplgvmsaCDnttJkZcvkyZTVq/XzyuRXgqSa
	zBsnMRymBA3a4iVJIDC/Uqz6sjRzkkR0EmmqC3OE0/bnYGBbUdZkoAVHL/MBZx9Bjytds3dLKy0ij
	DIcPQMKF6w3Fv5mlT/MDKbHCdVy2re3Xh66fCAb+aXg7SPyN8YF2qkaoLAa6FQCSP1Ccmr2DlPZRs
	u/GCQdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTJw-00000000nWX-0uGs;
	Tue, 02 Sep 2025 15:53:20 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPq8-0000000H8JG-3nVC;
	Tue, 02 Sep 2025 12:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1756815015;
	bh=5XjTx7iK7PHq+3BKdY0v5CJO3xIQLjdIo808+rqI8JM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J+4N4aq6ngHs+ccgv27484VTZULp5l5v/wrlliCsZwWYcCoaNPhdAW/RoqndD8J+n
	 HOIs/OyO2bVuZufZMOObfjWNTCXguJDsXEL64wszwixL10CNyyQLlTThhKW5hA5fI6
	 Qftx6w7hSZyFoUUIzNXYYSxB0HV5qUfWu5rdRow0erHV5xYhTUHBkYYIrl/c2PmmlT
	 sF4GDsBDK3lPXFGcsOlzdePwHGewdw+hFibP89j59+ah3v7La+Hy6oo9Q2E/7PnZee
	 jmXXDy0bY0A66fjWs3RPFY3HI36/Er/CM/u0QApZdKWhr/n5UKe8n3xqCgECi1Urka
	 MofjlD47NFgdQ==
Received: from WahpenayoPeak.tahoma.link (unknown [IPv6:2600:4040:50be:5a04:892f:ee51:308e:70d0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 1DBC827E436;
	Tue,  2 Sep 2025 12:10:15 +0000 (UTC)
Date: Tue, 2 Sep 2025 08:10:14 -0400
From: Erik Beck <xunil@tahomasoft.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andrew@lunn.ch, conor+dt@kernel.org, devicetree@vger.kernel.org,
 heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HINLINK H68K
Message-ID: <20250902081014.0e6eaaf2.xunil@tahomasoft.com>
In-Reply-To: <20250902070019.856305-1-amadeus@jmu.edu.cn>
References: <20250901100639.234ba07b.xunil@tahomasoft.com>
	<20250902070019.856305-1-amadeus@jmu.edu.cn>
Organization: Tahoma Soft
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_051020_997372_3055F8EF 
X-CRM114-Status: GOOD (  18.48  )
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

On Tue,  2 Sep 2025 15:00:19 +0800
Chukun Pan <amadeus@jmu.edu.cn> wrote:

> Hi,

Greetings!

> 
> > So what I said earlier regarding rgmii vs rgmii-id DOES NOT hold up
> > under more rigorous and careful testing.  
> 
> So the following question does not exist?

Yes, that is correct. My earlier question/comment/concern about a huge speed
difference between rgmii-id mode and rmgmii doesn't seem to exist when more
careful experiments and testing methods are used. I'll elaborate some more
below. And I apologize for any inconvenience. 

> >> Changing this makes a huge difference in the ethernet throughput speed.
> >> With rgmii-id mode specified, throughput is about 6.5 Mbs. Changing this
> >> to rgmii mode increases throughput to about 960 Mbs.  
> 

I'm still a bit surprised that my first test method (web-based, like fast.com
or self-hosted internal download speeds) gave such different results from more
comprehensive and careful testing with iperf3. While certainly web-based
methods can't target a particular interface, nor do they have many other
potential adjustments or refinements (UDP vs TCP, etc), they have been and
continue to be a useful tool for me to get quick information about the status
and health of my network and its devices. 


> If the iperf3 test does not reach Gigabit, you can run it in
> multiple threads. e.g. `iperf3 -c xxx -P 4`

Thanks for the tip.

I remain keenly interested in seeing a patch for the Hinlink/LinkStar devices
make it into the mainline kernel. Please let me know how I can help your
(and others) efforts to accomplish that.

Regards,

Erik


