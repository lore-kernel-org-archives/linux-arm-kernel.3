Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3A6E6B242
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LY3owCT+fxzpVsdv6gZVjqkezE1VdfXtNd84/LlaGZc=; b=smjVSm/4IiTrWae8kogQjM5dBf
	OyPjQvPbqBe3+D+X7/hqZXZ5PB6/Md/Qh3EWARMuuOWHl7Z45R+1M9Ypvvh3mwZ8rvhPkSXJ55lfe
	1E9RDRVhILk9E3B26vg5jSMo7Rk3827zdBCz9SAyvqkeoGuv85F9WoTULwakBpWYBfR8pRcHlnk7k
	4sKas4N3f60ZoMem0Pq6JFjNUWo0BJxNgsPehS9O835gHnDoVn1vFUgssB0ucbRKJbO0PK75g79iI
	glC14qaxx9AuXnHlGwXfXMhvqzQwNYtDxjj/rhqXuKe+J7vNRDCMQ7unzIMOKHFlMGM+/awx9RBxb
	7/UjgY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6on8-00000006Yjr-44CQ;
	Fri, 01 Nov 2024 10:22:06 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6obX-00000006WAe-1F2c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 10:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LY3owCT+fxzpVsdv6gZVjqkezE1VdfXtNd84/LlaGZc=;
	b=e1JdzxSRYWVsfLiA7wpOUEa7KufQ2DsmxD4xMbw4TFsMJC5FG6mtuDHbgAKkAZ
	8F43R3mX8RSfZDWfBIaH0S08M2V5xLi6uUjZbntlVz4TzGc2VyBV0SBF74GiwhFN
	4WN3W2VAq1Nz+7Epha2KaEU3HAxwb3y8HzkdgnV/1I+z0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAX_kDtqCRn8lNkAQ--.13729S3;
	Fri, 01 Nov 2024 18:09:50 +0800 (CST)
Date: Fri, 1 Nov 2024 18:09:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx6sl/sll: Add the "fsl,imx6dl-gpt" fallback
Message-ID: <ZySo7JhlYmEPpgd1@dragon>
References: <20241023190002.1183938-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023190002.1183938-1-festevam@gmail.com>
X-CM-TRANSID: Mc8vCgAX_kDtqCRn8lNkAQ--.13729S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1rKFyftrW7XryDGFy5CFg_yoWfGrbEq3
	WkWr1UWr4DAayjq3Wjy3s3JFWfJ3WkZr48XFW3K3yDXa45Cr1kJ3y8Xa4UX342vrZIqFyj
	k3yUJr1UXr129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Y-e7UUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwCKZWckj-1HagABs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_031007_826183_33BB6DE1 
X-CRM114-Status: UNSURE (   8.83  )
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

On Wed, Oct 23, 2024 at 04:00:02PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Per fsl,imxgpt.yaml, the i.MX6SL GPT compatible should be described as:
> 
> compatible = "fsl,imx6sl-gpt", "fsl,imx6dl-gpt";
> 
> Do as suggested to fix the following dt-schema warnings:
> 
> timer@2098000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx6sl-gpt'] is too short
> 	'fsl,imx1-gpt' was expected
> 	'fsl,imx21-gpt' was expected
> 	'fsl,imx27-gpt' was expected
> 	'fsl,imx31-gpt' was expected
> 	'fsl,imx6sl-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
> 	'fsl,imx6dl-gpt' was expected
> 	'fsl,imx6sl-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


