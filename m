Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32488CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Date:Content-Transfer-Encoding:Message-ID:Subject:To:From:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KSMVrGeVII0CqF5TK1P9h0S2HR5G7KT2cLLZ17gvFMo=; b=2hoq18/CGagFlDl6ePEba4VAgA
	McsUKy7Hv7D9VR4BVgqoEdNqCokVJEv75NIFKztDvTEhpaIyvpll0KI1h8J6POl2wHqtkQbVL1/kC
	fRSygrNASyAaRrG8pO6eHLmq7WhFr3bKMBb88xAbHM5SecKhguQ7IUOyAjJwFIJq0sSyzqh43bRIk
	bBs7lQnN/Jbl74eA7ju3lefDg4m5+uajVm2Og3Mhcl9SQ5h16JhElvUQ4bnmfbN973NEdUN5QY/iy
	2x7lrjJpb+6MdqpiKJ78sBKPGMNM3+gfS5SYCW5uXUxRQFm2sqUyHzXBBxZ7+wqSK0O5/RW3b7tyS
	tDp9zNmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXDE-0000000D5RU-31pI;
	Wed, 05 Nov 2025 06:41:44 +0000
Received: from 210-65-1-144.hinet-ip.hinet.net ([210.65.1.144] helo=cdmsr1.hinet.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXDB-0000000D5R6-2zlj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 06:41:43 +0000
Received: from cmsr1.hinet.net ([10.199.216.80])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A56fWHh627750
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Nov 2025 14:41:33 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=msa.hinet.net;
	s=default; t=1762324893; bh=buh6PEF6pJSjk7LJzMg0h8eeWIg=;
	h=From:To:Subject:Date;
	b=CjM/NqWINqeWszjoJQSXGUMnN7ecBxuSQXex4cmVpsM7sN9drIpmiU3EuJj7WGbcV
	 jv6OV89pWL/e9PO2kjN+qA/97vf8l5JMsnONhQRgSqa8bVJIurJU67Y1G3urIcDDmd
	 xiljawklNkTsksWOASXmh8NGcWKoqWITxcnTnUxo=
Received: from [127.0.0.1] (36-229-45-97.dynamic-ip.hinet.net [36.229.45.97])
	by cmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 5A56coXs374331
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Nov 2025 14:39:37 +0800
From: Procurement 73526 <Linux-arm-kernel@msa.hinet.net>
To: linux-arm-kernel@lists.infradead.org
Subject: =?UTF-8?B?TkVXIFBPIDYxODIyIFdlZG5lc2RheSwgTm92ZW1iZXIgNSwgMjAyNSBhdCAwNzozOTozNiBBTQ==?=
Message-ID: <78d3850e-e11a-95bf-4ddf-1a66a5b5ca1e@msa.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Wed, 05 Nov 2025 06:39:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=e6elSrp/ c=1 sm=1 tr=0 ts=690af129
	a=Z4yCq34gZZIglq7SYWyWWA==:117 a=IkcTkHD0fZMA:10 a=5KLPUuaC_9wA:10
	a=pz8J27t7F6_C_cTTL8cA:9 a=QEXdDO2ut3YA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_224142_101212_EA3AEE7A 
X-CRM114-Status: UNSURE (   2.71  )
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
Reply-To: Procurement <purchase@pathnsithu.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Linux-arm-kernel,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: October

Thanks!

Danny Peddinti

Noble alliance trade

