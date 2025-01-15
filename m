Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7812FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qucqar6HUi7wGW1W5TC3J/YSVkxpWjIVUzY/b7JOA4M=; b=StQHTD8hKn7PXyhKwvAQGwFXFC
	3z3El2l3zFtanWsa+EwXzOBuikJ+Db9NNd3uzsVW/DereA6CSd7KQHFIe2Isp3pIx2SRKw5CJMyKA
	DISl34oEpT5+3wiGBULFj46O6W1sRsuQyGsebVP7xPWOAbdlfG9YN9o6qdaHmSWVpT1/26X8VmbIY
	/jpvxyxZV3gEdRj7X1hindMOQUL5DloFwS1SMcO5Rrz2ANV9fWCyUvMrzgi/iXDa7O6M3cxy3W15p
	WIbhNn7z8B7n7x28btXuo7YX+mzUdXBk7AZnkUXU5BtuxghEh/OkjzP8O7HVINO0os1hEkMNHOFEm
	0CYDPIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyTN-0000000B2Wh-0OEY;
	Wed, 15 Jan 2025 08:09:57 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyRW-0000000B2Ab-23sQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1736928481;
 bh=qucqar6HUi7wGW1W5TC3J/YSVkxpWjIVUzY/b7JOA4M=;
 b=fxquBoE3bTU9zZiqbcuRz228Q+s9Eb/FQC73wJR/spM35vZiZjCcD1wqDIBi0fw7G/jFF0Hn/
 QpDqIck1CuA6ltCSVDtiCBLulxzJdYjxJhA1fbnsfAmYCRbLnuMQFRhT1AEyEDA/gdUWu2oeCK3
 cDfk1b9L/KJkNso/aLgKVhLb1Q8xE9F20pvATiq161IqwI+YRv07g8X3Cl/5c9xOpaB4MzHazxE
 3CLEtZt9Dk1gy7jimW24GelWsLN1+vlwvqZBhZwpsVNBMuKpyxTV5lCcYoSAVRMjblf5lq50OuG
 Bcy8OzxVhHarjeb4AedmDSHoAYO38TA1FBbqfZv7DECw==
X-Forward-Email-ID: 67876cd77efc61f2763fc053
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2c221084-eef5-434c-9919-f6746eae8e0e@kwiboo.se>
Date: Wed, 15 Jan 2025 09:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: "heiko@sntech.de" <heiko@sntech.de>, "kishon@kernel.org"
 <kishon@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "liujianfeng1994@gmail.com" <liujianfeng1994@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "vkoul@kernel.org" <vkoul@kernel.org>
References: <df8e0ff8-355b-4c18-9349-0f04ae16e01b@kwiboo.se>
 <20250115040003.29306-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250115040003.29306-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_000802_886176_91B25331 
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

Hi Chukun,

On 2025-01-15 05:00, Chukun Pan wrote:
> Hi,
>> The commit fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
>> broke backwards compatibly with old DTs and has already been backported
>> breaking i.e. PCIe and USB on Rockchip RK356x boards on stable and
>> longterm kernels.
> 
> The dts changes have been merged into v6.13-rc7,
> maybe it can be sent to linux-stable.

The original commit broke ABI and does not allow upgrading Linux using
an existing device tree, even if the DT patch adding reset-names props
also is backported you still have uses in the wild e.g. U-Boot v2024.10
and newer that comes bundled with an unpatched DT.

Trying to boot into Linux v6.1.123+, v6.6.69+ and v6.12.8+ using the 
U-Boot bundled DT for RK356x boards now result in broken PCIe, SATA and
USB thanks to the offending commit fbcbffbac994 ("phy: rockchip:
naneng-combphy: fix phy reset").

Regards,
Jonas

> 
> Thanks,
> Chukun
> 


