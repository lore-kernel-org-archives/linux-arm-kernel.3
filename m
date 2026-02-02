Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2255CE7315B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbDR66UHgtoMBuhFvGughte3mGcWvDFLPT55VUGio60=; b=hOZ4gZWfnSJvC5rQ8tlrSMwtbM
	/O01yeZEpin88cv5x27DUjKKiR5gen16kCQG/FTLmOodAghV80XqZ/jH/IWbPhwOsZVP2Hz5WNd8C
	IJ6j/11qzL0iyUqEg8MjgbMLh5EN+tuHlht/YX6cjG/bq4yU0xr1psOK2YxfClBQocFf+QZpB9iW2
	4FUSNb/l7NrUTX13hJmlMT1MuZbeA6kcgETWpsu54vq0J+cYkOpsGq/MrNJTJwnM6BrZBsetHxYp8
	Ec8CNjPjWcVaa7QPCnXlizWIXVmqxshhZrQOZ3hFIy7Ma9lJ/1hFVgMGlt59FcfwnlwfA2lBABOrh
	weq4AHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsKI-00000004vIi-3bme;
	Mon, 02 Feb 2026 11:42:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsKF-00000004vHu-1fQO;
	Mon, 02 Feb 2026 11:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770032555;
	bh=w7krebU2H1Mpuz4YFi6JBpMGhVX2NYi1AWbumRrPDkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qTCNvj/bQDmaAHIv567WhqG6RBXfeMpXqP4tocFYidQG+D51ESaH6nkX/efvGvdPt
	 FAMFdBKAlI0892rG877TQ08ZBIQziKgXGoH8z9WXx05HaiLWUy41RwBA+DbVhukuZN
	 ftihXDoqLIzKXn7Vsqy7F6DYnELi/wzLDYtEopioyWQcTLqfjrGwuYhARnXWgIq+WA
	 PMyYgz8QUneYI2UejnZhYGwKkRTpIa+CwCpdzl8JAf5d7Xs4SSX0nJoWKBfGfwrCRu
	 N8j1KPtUyG8iMQXiPvTWvOAQNH5Dy1iGFUF7TeSKWg2k2HBqw0TAjc1XxK/Bgwo9di
	 RHv/Cb/sV+n8Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8202117E130A;
	Mon,  2 Feb 2026 12:42:34 +0100 (CET)
Message-ID: <845cca9d-1912-4f00-8245-3d5293f164db@collabora.com>
Date: Mon, 2 Feb 2026 12:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: host: mediatek: require CONFIG_PM
To: Arnd Bergmann <arnd@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stanley Jhu <chu.stanley@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Chun-Hung Wu <chun-hung.wu@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260202095052.1232703-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260202095052.1232703-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_034239_713040_BB23DBE2 
X-CRM114-Status: UNSURE (   9.94  )
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

Il 02/02/26 10:50, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The added print statement from a recent fix causes the
> driver to fail building when CONFIG_PM is disabled:
> 
> drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_resume':
> drivers/ufs/host/ufs-mediatek.c:1890:40: error: 'struct dev_pm_info' has no member named 'request'
>   1890 |                         hba->dev->power.request,
> 
> It seems unlikely that the driver can work at all without
> CONFIG_PM, so just add a dependency and remove the existing
> ifdef checks, rather than adding another ifdef.
> 
> Fixes: 15ef3f5aa822 ("scsi: ufs: host: mediatek: Enhance recovery on resume failure")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



