Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1FACDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 06:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VxvGuHBm7QRMgH1+UXtZriiR1pff3l1vGhukdnKhsI=; b=1Xl4YqUKIZdkd2TlyiGn8AqDPC
	lEBKGv9RSenlk345gtSv/glsW+nJLmG38r7UERTmNQbdBOTAk/VCKhrysAqSlrT5Xq24WsoWT7noV
	L+0zWo0/BJindVlrX4kanUGdmJ5huR4/rvIUiIfun4RcGOcEmZc42vRwZhu9s7bTtvN88MNlw7mHW
	buWQ6/pAZtjo0QPIAC9hAzz4HR5UurzlstgJ2Hc+WcT/E1HMNA3MmuVrjE30LTjEoag7nzYFSaMRk
	ttZmpToKkKj+vpYjb3kPe8/J423YquPbJoG7cx1Jbf4NbW0qG4sFQycT9Ky/JD9O6rsv+P/PnNmm3
	DIEUlqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbY1f-00000004TQ1-3AU1;
	Mon, 22 Jun 2026 06:20:55 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbY1Z-00000004TOk-0I83
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 06:20:54 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260622062041euoutp017fb735f4174c8eab82465b4c2afeb247~7UunJYufK1470914709euoutp01V
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 06:20:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260622062041euoutp017fb735f4174c8eab82465b4c2afeb247~7UunJYufK1470914709euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782109241;
	bh=9VxvGuHBm7QRMgH1+UXtZriiR1pff3l1vGhukdnKhsI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BzrEI3rlT7Cut3revlqskhFZzAscF8tJ0GJY3STuZ8lA4OKymLfOO41Y39dLHWGSZ
	 s1xAn6sC0OewpBdDlD9UPZ6LjMUMCcnusX6rGQAsdj/ZW4vVLvyklYtSLFOsX4Bu/b
	 X0FeCniXtB1R7ZWNBq/RQuDMW5EZmwQ6mf6VDfrU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260622062041eucas1p1ee4fe04e8101bb5b94a29aa0f679b133~7Uum5HyCD2305623056eucas1p1p;
	Mon, 22 Jun 2026 06:20:41 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260622062040eusmtip1c9e2845d4956b74ea376cf286db45bf8~7UumZGOdy3122931229eusmtip1b;
	Mon, 22 Jun 2026 06:20:40 +0000 (GMT)
Message-ID: <14c67cf2-d252-4b49-80f1-fa1c711a0b11@samsung.com>
Date: Mon, 22 Jun 2026 08:20:39 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional
 EL2 virtual timer
To: Daniel Drake <dan@reactivated.net>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Marc Zyngier <maz@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	andrea.porta@suse.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <89a39670-c459-4467-a032-a965bc1dea6b@reactivated.net>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260622062041eucas1p1ee4fe04e8101bb5b94a29aa0f679b133
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260621205817eucas1p24b92a3dbb913783a205d435e9077e61b
X-EPHeader: CA
X-CMS-RootMailID: 20260621205817eucas1p24b92a3dbb913783a205d435e9077e61b
References: <20260619204832.586079-1-dan@reactivated.net>
	<878q898ulx.wl-maz@kernel.org>
	<223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
	<CGME20260621205817eucas1p24b92a3dbb913783a205d435e9077e61b@eucas1p2.samsung.com>
	<89a39670-c459-4467-a032-a965bc1dea6b@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_232049_579704_9421937F 
X-CRM114-Status: UNSURE (   9.95  )
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

On 21.06.2026 22:58, Daniel Drake wrote:
> On 21/06/2026 21:03, Florian Fainelli wrote:
>> Daniel, do you happen to know which 2712 SoC revision you have, whether this is a C0 or D0 stepping?
>>
>> We have an internal bug tracker item pertaining exactly to the virtual timer interrupt connection however it affected a sister chip (77122) and not 2712 AFAICT, now checking with the design team whether the same happened on 2712.
> Thanks for looking into this! I am using Raspberry Pi 500 with D0 stepping.
>
Here it happens on one of the first shipped Raspberry Pi5, so probably C0 stepping.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


