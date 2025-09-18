Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9C9CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Date:Content-Transfer-Encoding:Message-ID:Subject:To:From:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tmUK5RaEabijpt54ibk4c+G+vXTWEzetNX2FjaSbF6o=; b=DTM4OMvY7Omi0x5BwePs59tLQM
	ovE9TJD6X/rYpxgzUoS7QSZz1kz2dnsrwCJUuD/5uzh31QOsU9Yx70HhPnZJgbnHKtH8fizEx/iPQ
	GzzKygmTDbChlCz9tSyhK6UH8trNbRdBvVItIs5FywVH45CBDuayAl4a7rep4IVjm/CSGR7U0m1Zk
	gv9Ptj4DTw5ScH6Qk5RPDK/tJmYx451/5JKKTGsRffFQ55VM8qLxISwNOzRTsk/wCoqI32LsoBET4
	x/E4hLTGnQm1XYPG40EBCrhQX7AGSj1jyl6il9gRFe7L8u3WLSb/+eZRpBuYbBgE8BYIL4TinK4wS
	7XyORyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFdy-000000009Bp-2mFy;
	Thu, 18 Sep 2025 14:29:54 +0000
Received: from 210-65-1-144.hinet-ip.hinet.net ([210.65.1.144] helo=cdmsr1.hinet.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFdv-000000009A3-1oWy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:29:52 +0000
Received: from cmsr7.hinet.net ([10.199.216.86])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 58IETaf1294976
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 22:29:41 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1758205781; bh=lMVaGSnUvY8rkVsR3++x+Jv8+jY=;
	h=From:To:Subject:Date;
	b=Hy7OnTLL7NyMVQ5miJwEskbalKycs5ENYdKaEiDDdnmA683kjTwFGGTmCsp7NChPZ
	 IzaJ1vLoEKooEV3jBKQ/mauxKtasm32Wx/y+aRHF0HZT8V6eMm8KZXKhT4Vj24flUR
	 mnX7NR8pUUHIYCFlS/X6XorPbcpmH1OBP22qhnyI=
Received: from [127.0.0.1] (36-238-157-85.dynamic-ip.hinet.net [36.238.157.85])
	by cmsr7.hinet.net (8.15.2/8.15.2) with ESMTPS id 58IEKJ2Q974183
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 22:22:10 +0800
From: "Info - Albinayah 232" <Linux-arm-kernel@ms29.hinet.net>
To: linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gNzUzMDQgVGh1cnNkYXksIFNlcHRlbWJlciAxOCwgMjAyNSBhdCAwNDoyMjowOSBQTQ==?=
Message-ID: <162ef0e2-964b-003d-f837-e6b3136e3429@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Thu, 18 Sep 2025 14:22:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=LvQxyWdc c=0 sm=1 tr=0 ts=68cc1593
	p=OrFXhexWvejrBOeqCD4A:9 a=QL9UKaV4xa9CxA6sSeDbjA==:117 a=IkcTkHD0fZMA:10
	a=5KLPUuaC_9wA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_072951_998725_AE3423BA 
X-CRM114-Status: UNSURE (   2.53  )
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
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Linux-arm-kernel,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: September

Thanks!

Kamal Prasad

Albinayah Trading

