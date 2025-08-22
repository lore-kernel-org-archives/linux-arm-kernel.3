Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220CECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TecC6It8vD0dDgeTtYW5QVx+UkomFRLxCAo6+DKhaVA=; b=NuQmxawQYaDeMwWzbUrmHcRGZx
	Fw0s1sPDuF0ITemv7lQYrKNJXNLxvm8Zpz6dpmyx4f2JFj/6JW6ps6puWtVfOYBZUQ8SyxN7TXATu
	++46EIWmH9jI7ndLq6jZYytVKIZRLWEIWVAjRpwcMZ+iVSYAeUfDGSP5xysX4rokf5j067B9WCmCX
	pv4u6DpcIPdh+2eGs7lHC6OSqi1us0ZDi1vxW0Kl+QdTlrOXzkcaduMYymcJAkWDo5S0Tfa4K3tE8
	pXvlDs/iJwr9+B9B/F3NMEnqO0QTgjpzaaJHhu4HYcBXZg2I3LNphC65Bxa2P1lFmQyz/VLBjR1qF
	hhNsfwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKzv-00000001f86-103I;
	Fri, 22 Aug 2025 06:11:35 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG93-0000000175t-0qXn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:00:43 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c7MHG1wC4z2Dc3f;
	Fri, 22 Aug 2025 08:57:46 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id F23C4140258;
	Fri, 22 Aug 2025 09:00:36 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 22 Aug 2025 09:00:35 +0800
Subject: Re: [PATCH v2 1/3] irqchip/gic-v5: Delete a stray tab
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1752777667.git.dan.carpenter@linaro.org>
 <670bb1dc-7827-4916-84f3-bb46ee408b20@sabinyo.mountain>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <329bff25-69bc-1bd5-16d9-7b0fc8173851@huawei.com>
Date: Fri, 22 Aug 2025 09:00:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <670bb1dc-7827-4916-84f3-bb46ee408b20@sabinyo.mountain>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_180041_448426_B1841462 
X-CRM114-Status: UNSURE (   6.27  )
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

On 2025/7/18 2:45, Dan Carpenter wrote:
> This line is indented one tab too far.  Delete the tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

