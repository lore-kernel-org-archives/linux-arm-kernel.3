Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD07C1049509
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4VOB6VcuTGOaol854cf9wlpyM/xzt3NDhYCz9oNnmc=; b=A4soAR24WCfN+TydQJakTnGWRF
	P0uaL0W+S07quQK7IqyW6tje8QtYCzWfgR7quGnjvtvyYSqYnEpXQoJEhDYNmN7hw5AibPXBTt2M+
	C72d6nEqYC08vswk/+HbV1U0rVNPR4pgXetykJufbcP2HXFpUsOVBsZfNfn79e9PAEhbGzBkBuInB
	DT4SdK6aP0R+RICfCk6DW/K3ZSBKf3SGJyFl8cVCREiWmJUpfwZtDePjK7GAqOdaywSRMBxWqMoCU
	zvZ6FgnMc/qz41o9G6um9XML6dpfazhZfjBLZJsE9WnzzrjqPuoKnBmIlvQ46U58garpkPefYtJnc
	dnq/Zs2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gGi-0000000E8oh-3AeJ;
	Thu, 12 Mar 2026 13:40:04 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gGg-0000000E8mr-15ps
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 13:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Z4VOB6VcuTGOaol854cf9wlpyM/xzt3NDhYCz9oNnmc=; b=OyqJ/8cOf78sn4RjhQgjMKRzVQ
	wyql+htRjGCoc3FI1dARHaHMj2DLhgkLLM/tQ18/HsSM+B4ux65Z39hp6aj6GsFR6YvSkGnVONDJ2
	B53Op/OfEMdAG5zHjkreGQe2dumI3MFp+udQeVIUnWTEcgNGvOje2qisFwux9M1qjO6MvTYW1na7C
	drit3zX7J9bSo6wzkmwwZP6qykNZ9CV5EDWj9EnlJwvDw3z2vWBK5V9hLI+M4VuuiUJLIb+BjP5IP
	YKl8AqGXm52UiVVHvPeMbIeylQ45z6UsOEYu2r7Bup7R+0EPsTxU+TKm5co2xCfhBBNShEyvmUzwp
	3yQ8q1hA==;
Received: from [115.246.246.98] (port=60572 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1w0gFw-00000005g92-0QIT;
	Thu, 12 Mar 2026 09:39:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 478FE1A82054;
	Thu, 12 Mar 2026 19:09:07 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id JHwpr-2yyxUd; Thu, 12 Mar 2026 19:09:05 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id C90691A82055;
	Thu, 12 Mar 2026 19:09:05 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id nsO2P5nHhitS; Thu, 12 Mar 2026 19:09:05 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id A2D041A82054;
	Thu, 12 Mar 2026 19:09:05 +0530 (IST)
Date: Thu, 12 Mar 2026 19:09:05 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Parvathi Pudi <parvathi@couthit.com>, nm <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux <linux@armlinux.org.uk>, 
	ebiggers <ebiggers@kernel.org>, ardb <ardb@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, arnd <arnd@arndb.de>, 
	kory maincent <kory.maincent@bootlin.com>, tiwai <tiwai@suse.de>, 
	andreas <andreas@kemnade.info>, 
	prabhakar mahadev-lad rj <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	twoerner <twoerner@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	praneeth <praneeth@ti.com>, srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	danishanwar <danishanwar@ti.com>, m-malladi <m-malladi@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>
Message-ID: <540368735.642598.1773322745594.JavaMail.zimbra@couthit.local>
In-Reply-To: <31a75415-43e5-4b4d-aa6e-0e58519a3d1d@oss.qualcomm.com>
References: <20260307133237.743059-1-parvathi@couthit.com> <31a75415-43e5-4b4d-aa6e-0e58519a3d1d@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm: multi_v7_defconfig: Enable BRIDGE and
 DP83848_PHY for TI AM57xx, AM437x and AM335x
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x
Thread-Index: u0OXRHxkr1RmrznGWwvkA93ybpr1RA==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_064002_421045_C06B2181 
X-CRM114-Status: UNSURE (   7.03  )
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

Hi,

> On 07/03/2026 14:32, Parvathi Pudi wrote:
>> This patch enables BRIDGE and DP83848_PHY as kernel modules for AM57xx,
>> AM437x and AM335x SoCs. BRIDGE is to support STP/RSTP Switch mode using
> 
> Bridge does not look suitable for defconfig or I still miss something
> here. Is it a dependency for some driver?
> 
> In case you wonder: this is not a distro config. It is not meant to be
> working for your customers...
> 
> 

The PRU-ICSS sub-system available in TI AM57x/AM437x/AM335x SOCs is capable of
operating as HW offloaded L2 switch (STP/RSTP) with 2 PRU ports, by using Linux
switchdev.

The proposed changes are required to enable "bridge" config to get the support
for Linux switchdev, hardware offload features, and STP support to get a fully
functional L2 offloaded switch.

Thanks and Regards,
Parvathi.

