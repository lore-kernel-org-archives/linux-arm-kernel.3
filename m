Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B7FC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Content-Type:MIME-Version:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwH9ABw/DM5LWNp+iWqHtTnGq3exluZ0De94TCsyzWw=; b=qSM+k6GMWyqCJjrh19q5/tJNSy
	ZSjNvWLH2SD3SJ91iTCKyfxE4DJAulIrzRJkeiVt/u6NliN0zhpdfC49+ZHI0tU1TC/6xO9qXOH7h
	P4AJ2G6OdXmlJXgDSN0ks4c/lTVQ/t9sNvsvNDbGjbdolwA3XNOmCzn9SfNIs/ihpoqib8aKrs2+F
	WzafaIVd0v7lL1FANgQHil+CQ1muNhKrPfuKAVGcRVV7ucWd1KPBzde/AxGHiLtLkTW7kJ8S1yoOm
	AioZ5JH4eH8X8uA0YEoD0fpwbFlr83wVaBqRgr1WqcdpBTUJ5atrxryQ7yYK75eBxHU+6/KqLKltT
	9oz/IvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eZN-0000000DrkM-2ukh;
	Wed, 02 Sep 2026 06:35:37 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eZJ-0000000DrjS-1bwe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788330924; bh=YwH9ABw/DM5LWNp+iWqHtTnGq3exluZ0De94TCsyzWw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=rCcqTu9kTh4ptTsY7yyn8b1oCi7U5TjYJsbKs2aOS2PMOjO0PzPAVhYymqVVutIfs
	 bqvQJo+xEfU00WG8MyH8/YqSfaHtxFsMnSMWTfNFaPjPa4WflL0iKNz7Z2SvCO7B9s
	 ZJE+QAOrbKS4J4AQTx8Ns/1Gn7h6l/E1rz2kkwyo=
Received: from localhost ([58.240.122.156])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8D5AE878; Wed, 02 Sep 2026 14:35:21 +0800
X-QQ-mid: xmsmtpt1788330921tfwguak9h
Message-ID: <tencent_BD8B7DCB7F9C5B07D7EDF04E47DE1F41A208@qq.com>
X-QQ-XMAILINFO: MqswyhUqVe0C0RtcQUTbRaXR+/SrHTTmTaLeaKKyUG76GETP49CR7iM9aOyiYr
	 z/lHjInZ/qyrDzNHVbd+LPoea2AUlKHvWUTQeYElUSvxB4MLbk0XSlsJ7Sa/9czd3TI4J20Ru+YO
	 ScGs9Ji2fCX8CsIuunCIgcB4aaiuhpWVYrVUfiogvl9EB5tRupaFPo9NdfK5Jj3ahHB0m5BSRz72
	 GzU5/umsJMtqifR0iaHA10oePvH5gmHtKDWhkaytzrPHa/1HXnSuVLSmc67HyqOY713XqTXLwdfq
	 JynDa+P5UnWYx8DlN9GGHqXcMe3m6utGeTvmW498c1/gmSSYHHCwsQXA+WWq7TAzhZcj8xyaeXc+
	 rMGJNCHHY1wm9zNj4BmEyPAi1mGKfrJAkmx0iDcl2lAHany4i4DDkriGftMRefUN4BvFwOg1qLBW
	 +M0/YcwlOrHt8/MZJqlv9jFbWgWCjP+vclwWpXSJm4gsyziXivaHxCrR3YwJljYuuqll/TK7GKJS
	 YwYVKXtMD6Zw6c43drrFQFlHJBaNa84wULKaBK4if5gk3cHmu6su5Lm7cs9nmQRI9qr2ZFOa6bWg
	 yOH7D5TYkw1qGAOyftoDp/GyDgGb2xUNXdRa/N3kPzYq79GNvJgEsbwjxVn1WoDF4QSL96j+03Ga
	 4Bkc4dDWGZ6JklNPjSvsngHsSr85+CSz1gC1RIjdAWbS5tUPf/ORaO4RLx4lMC6eFCQu2HgEDHwm
	 WQh//+zqYpQJ5YcIB5eQK7cQLVpSpJ8hdY0ZSV2wX8rIeTYP+uRmMNXbs3sza5sHt79Qz6Gxup+Q
	 6qFU/sYhVv/duQg8m/kbh29CWd+32dVr5vcXOmOzZT5HwGq+BpVzQkG8ZtEb31KcSa9Ys9vf8MFB
	 UaHJe+egqpLn32gIT6HrhCzxzLh5AtX6NoIZrPDktpPHEHAiM7oKJFJLZfiC7paMfs94qMikIQVh
	 eumCxbdJXJGgU0BgA9hwuuL9kQympreXAte8PGIeOzsWNBFL6GxEs/B7hTeP7pt9ckLt/iIN4u5J
	 Sda3pdG3wdHN7l8o02XB9oKvRRgsON1aIfZQ21BMHWIuy3qfSOs2B6CCp6u0lT1Ec6DfeB4Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
Date: Wed, 2 Sep 2026 14:35:21 +0800
From: Zhengping Zhang <aquapinn@qq.com>
To: ryder.lee@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, bhelgaas@google.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	zhengping.zhang@airoha.com, lei.dong@airoha.com, hui.ma@airoha.com,
	upstream@airoha.com
Subject: Re: [PATCH] PCI: mediatek: Find INTx controller by property
X-OQ-MSGID: <apfDqZZJv7PN8cBu@PC24010019>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_5E7D6E7FB25B4CD732F08547C11F5DA24808@qq.com>
References: <tencent_5E7D6E7FB25B4CD732F08547C11F5DA24808@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_233533_886965_16553F58 
X-CRM114-Status: UNSURE (   6.31  )
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

Hi all,

Gentle ping on this patch:

[PATCH] PCI: mediatek: Find INTx controller by property

This patch has been pending since August 5. Could a maintainer or
reviewer please take a look when you have time?

Thanks,
Zhengping


