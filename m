Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2EEC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMIjivGs+YUJa/yQg29y5qzQoUNnZZfwhHMWuu2jaL4=; b=K8T8bV5VDk4Awikh5iVVvt9pBX
	L6AiK6UZurCDoFHQLTkkI9VB6uIo0S4jwUw/i1ohFlJzXd8R9SOiEPDaQVKi5ZrslsLyWEI8FC+gs
	AkIsaKjSvbvU4IO6nueJYZA3g2yWuyhPgZlnDTI61rCJOgkOiMkXD/1As0CvFFMhv5feZdLemlb71
	UQF0p49iRc6O8myC1gNa+a3RSMgBp3PAnXr9muG9WGF2WgOAr5BA2gD3AcpFW2Aold6q43r3+VwsV
	/V1ucPzFPHdoovq5lsIWExswm6bu+f/bazGD7+Q5fnZ/1c3QSabFRZ8ibH8cUDv+kh/4vdZ/PPpuH
	KNdel6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcWv-0000000FAUX-11cu;
	Wed, 07 May 2025 11:01:37 +0000
Received: from mxout37.expurgate.net ([194.37.255.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcUx-0000000FANS-0cca
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 10:59:37 +0000
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <thomas.gessler@brueckmann-gmbh.de>)
	id 1uCcUk-002ilu-Tb; Wed, 07 May 2025 12:59:22 +0200
Received: from [217.239.223.202] (helo=zimbra.brueckmann-gmbh.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <thomas.gessler@brueckmann-gmbh.de>)
	id 1uCcUj-00GcMA-QI; Wed, 07 May 2025 12:59:21 +0200
Received: from zimbra.brueckmann-gmbh.de (localhost [127.0.0.1])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTPS id A9E3FCA068E;
	Wed,  7 May 2025 12:59:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTP id 9B435CA0800;
	Wed,  7 May 2025 12:59:20 +0200 (CEST)
Received: from zimbra.brueckmann-gmbh.de ([127.0.0.1])
 by localhost (zimbra.brueckmann-gmbh.de [127.0.0.1]) (amavis, port 10026)
 with ESMTP id J9uvJOYXCRuy; Wed,  7 May 2025 12:59:20 +0200 (CEST)
Received: from zimbra.brueckmann-gmbh.de (zimbra.brueckmann-gmbh.de [10.0.0.21])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTP id 8E630CA068E;
	Wed,  7 May 2025 12:59:20 +0200 (CEST)
Date: Wed, 7 May 2025 12:59:20 +0200 (CEST)
From: =?utf-8?B?R2XDn2xlciw=?= Thomas <thomas.gessler@brueckmann-gmbh.de>
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	"Simek, Michal" <michal.simek@amd.com>, Marek Vasut <marex@denx.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Katakam, Harini" <harini.katakam@amd.com>, 
	"Gupta, Suraj" <Suraj.Gupta2@amd.com>
Message-ID: <1814404629.486377.1746615560560.JavaMail.zimbra@brueckmann-gmbh.de>
In-Reply-To: <MN0PR12MB5953C8800220724906360D54B788A@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <20250314134849.703819-1-thomas.gessler@brueckmann-gmbh.de> <MN0PR12MB59531CAA16616476F2E09EFBB7DF2@MN0PR12MB5953.namprd12.prod.outlook.com> <MN0PR12MB5953C8800220724906360D54B788A@MN0PR12MB5953.namprd12.prod.outlook.com>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Set dma_device directions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.0.21]
X-Mailer: Zimbra 10.0.13_GA_4723 (ZimbraWebClient - FF128 (Win)/10.0.13_GA_4736)
Thread-Topic: dmaengine: xilinx_dma: Set dma_device directions
Thread-Index: AQHblOfyPgreEFaTb06QsgCB79kDoLN25v/wgFBhYuDwSRY+Zg==
X-purgate: clean
X-purgate-type: clean
X-purgate-ID: 151534::1746615562-29EE269F-4C6B8EFA/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_035935_332169_6C58FE64 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

----- Am 7. Mai 2025 um 12:20 schrieb Pandey, Radhey Shyam radhey.shyam.pandey@amd.com:
> Suraj also worked on this patch internally and he did set direction in
> chan_probe().
> So, I think we can switch to below implementation ?

That's fine by me.

