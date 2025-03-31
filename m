Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C18C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 02:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m99ywia6v/zzbZ+AojtgTPpg/C4zJ5qzVmKg5h2oWKA=; b=Ektqv42YhxyfI7deWjkDPyXTww
	DwL2A4ARj9hrjNzxykACo8Oe/olasPKjoHeaIlIfgvjA9RfyxLqgoW3ZT5eH7VbJM4MNoSY8x9APl
	/U4Cn4o84zxO/4uJ//ySSbgK4BukKNmqFPzx7Q5EjCWwjhwhSNpt9Q/F70zLDwrCd04miXcUTD92x
	7xyyoijnKRiTn7QdalW2CGjE2HQrU3146oOFl3vpgsTn+tMBh+951CgjtsV5tAIj1gCelLoI9+zSf
	VJUzg9rVLTg+3RO/NLF0fJI2ljLbQpKZTPXAsmfnxaTASzgRkBuhm+zC18k7v0FVUAWi64BfQg35Y
	swBHksYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz4zL-0000000GvTc-0mWK;
	Mon, 31 Mar 2025 02:34:59 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz4xa-0000000GvNM-2jST;
	Mon, 31 Mar 2025 02:33:13 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZQwCX5fkkz8R039;
	Mon, 31 Mar 2025 10:32:56 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 52V2Wt8c039043;
	Mon, 31 Mar 2025 10:32:56 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 10:32:57 +0800 (CST)
Date: Mon, 31 Mar 2025 10:32:57 +0800 (CST)
X-Zmail-TransId: 2afa67e9fed92ca-91c3e
X-Mailer: Zmail v1.0
Message-ID: <20250331103257372kkrgDrRRskdABmXRnmbID@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <krzk@kernel.org>, <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <zhang.enpei@zte.com.cn>,
        <linux-phy@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gcGh5L2FsbHdpbm5lcjogcGh5LXN1bjUwaS11c2IzOiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52V2Wt8c039043
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E9FED8.002/4ZQwCX5fkkz8R039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_193310_858419_FBFD56A7 
X-CRM114-Status: UNSURE (   6.38  )
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

>On 28/03/2025 10:02, shao.mingyin@zte.com.cn wrote:
>> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>> 
>> Replace the open-code with dev_err_probe() to simplify the code.
>> 
>> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
>> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
>
>Why are you sending patch-by-patch? Organize your work for the same
>subsystem into one patchset so we see entire picture at once, not spread
>onto 10 separate threads.
>
>Best regards,
>Krzysztof

Dear Krzysztof,
Thank you for the constructive feedback.
We apologize for any inconvenience caused.We will regroup the patches 
targeting the same subsystem into a consolidated series.

Best regards,
Shao Mingyin

