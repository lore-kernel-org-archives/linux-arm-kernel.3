Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDBDC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Npoyc6UgZLuFIpB9RaTbZpvCMTpy2k22vejLz5r1d9U=; b=ln/hgcN+ybgPsFY+fqwrko1Zd5
	QkeYgtgkGHMLXQ0YdaY7XrS0unzoZ9Us8kJFVQAzyff0vbwSF4IumpoIYTynYj+b6WeCcoLddR0Kc
	D+/U44qO3sAX9Xaabm345JhPOm+HhHhChCsRuz9A8Z5Vmi/wFNAPhGAaiwEeDEsjXRyU9QnQ3tlQA
	MJiIMzXBirggY4SWhJrD87s+0RE06IayJe7/Cfm4RSxFrDDZwauhFgeLlFS7kSuPzDmS6JiegOFYq
	Xx5C5reXcIcLrM/DXtidNKG0BpuomeIcluLCP9ZJKVFPhbbjNagNjhHHXSxUhOrHzbSCrRP+DBm1E
	V9wtMN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvkH-000000006tq-0qR4;
	Mon, 03 Aug 2026 16:42:33 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvkE-000000006t7-2cRv;
	Mon, 03 Aug 2026 16:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=Npoyc6UgZLuFIpB9RaTbZpvCMTpy2k22vejLz5r1d9U=;
	b=mBqsE2FJCt8LASLWEYHBNQC7JnZM+sJlFSBqrh3e9oSJTUfpQUPeP9f4Xtv6Tz
	nRZerYfKL94ScJgvtrHRqpgA1X4D+TnCPo57/c5BFijl9Eto+otynoQAiSJozm97
	toKHi41fUNJ8s7UG/ip+vkQd9zpf2zfqEGpg400pjeULo=
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnqYnmxHBqPXceMw--.40390S3;
	Tue, 04 Aug 2026 00:42:16 +0800 (CST)
From: Zhyi <zyheihei_123@163.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [RFC PATCH] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
Date: Tue, 04 Aug 2026 00:42:14 +0800
Message-ID: <178577533421.26919.15228893238527652331.h28k-rfc-v2-supersedes@163.com>
In-Reply-To: =?utf-8?q?=3CSJ2PR04MB851017E50140354C2F5B3FF3B5D52=40SJ2PR04MB?=
 =?utf-8?q?8510=2Enamprd04=2Eprod=2Eoutlook=2Ecom=3E?=
References: =?utf-8?q?=3CSJ2PR04MB851017E50140354C2F5B3FF3B5D52=40SJ2PR04MB8?=
 =?utf-8?q?510=2Enamprd04=2Eprod=2Eoutlook=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-CM-TRANSID: _____wDnqYnmxHBqPXceMw--.40390S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYPEfDUUUU
X-Originating-IP: [240e:390:2ef3:c801:e498:7ace:78bd:b49f]
X-CM-SenderInfo: 521kvx5khlsiist6il2tof0z/xtbC3AgivGpwxOhgQAAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_094231_112081_64322CDF 
X-CRM114-Status: UNSURE (   5.42  )
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

apologies for the duplicate: this v1 was accidentally sent twice. The
revised [RFC PATCH v2] is on the main thread:

https://lore.kernel.org/all/20260803104646.26836-1-zyheihei_123@163.com/

Please follow up there instead.

Thanks,
Zhyi <zyheihei_123@163.com>


