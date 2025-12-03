Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68090D12D60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 14:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObDfils7lqrSrCaJHfi5e//k696kbcJLjyy3mDEIVUA=; b=d0Li23/4KsXwg4ao+qTrYvMj9x
	vnI34bep7OijC1KQ8RKgb/SYzBsh8LNNQx+Dv0hkhMcG/XT1PrWgNRiygFI9JSY+313UUw3T9FBvR
	7LZ3HR+dX5JbP7Djg5kQuhjlTx1Jhsp9ZI+GSQtxrdBUzFfKTuhkAK1muOLo3Tp0pTjlgHuV1MfE+
	/PwHH2YyTlS3FLIW+t33Ie9jizPbe5pilD7FMAFpV0xjGwVXuOLfTKu2htKFKX/JEA8aEX2c31FZE
	BFooeheEjFjjESMt01ekTD0fJXrWiqxMNwbEw2axCLhZpzoZiKRQykPOtUXN7iQIxzcb4/IWXtSyk
	gkRpnYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnYj-00000006d42-236S;
	Wed, 03 Dec 2025 14:10:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnYf-00000006d2N-1iLS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 14:10:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E15B31A1EFA;
	Wed,  3 Dec 2025 14:10:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7B3E60706;
	Wed,  3 Dec 2025 14:10:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E7CA119202E6;
	Wed,  3 Dec 2025 15:10:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764771011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ObDfils7lqrSrCaJHfi5e//k696kbcJLjyy3mDEIVUA=;
	b=RWl3/p3ou0z+zKyk+NCA5Hjc+/J7APSSfgkfpRKEXTEo8Kp7zCmn4xc6+yOsVtlEy0Ba0v
	ynaLjQ6lJsukOCLNKwEwH4I6y8WdkGjXT/D92zRX3UORQcpMNmidOBQMWVR1OPnXMDHLCR
	mBjfA9P0BAT5WIKCbb5RpKJ5pInsGyNfPibCkZihdXGof7yI1S74FIuCIc7dQabX10FXi7
	3ph6mWsloROgKtFfsshVlpvCAevx7A7De4d2mRmAsCSZUGgzP1uoSmNFAP0GrDP+6DHPPU
	nr3SIjAE73opO+1OSovCkpHYpPTmmCeqwLpOFGimbZndnaE6Cjv27ragyIXzcg==
Message-ID: <07c7d2c0-f29b-4bf2-abf1-c640c39e6d7a@bootlin.com>
Date: Wed, 3 Dec 2025 15:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/4] clk: keystone: sci-clk: add restore_context()
 operation
To: "Kumar, Udit" <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 richard.genoud@bootlin.com, Prasanth Mantena <p-mantena@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
 <20251127-ti-sci-jacinto-s2r-restore-irq-v2-3-a487fa3ff221@bootlin.com>
 <1283df52-ee41-477f-8d91-5c4a02385cef@ti.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <1283df52-ee41-477f-8d91-5c4a02385cef@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Fuzzy: 41a41182b59d79f583916f68cda4ce24371bbb78bb5201448cdda28aa13f7e12f6862ad9c69aaabad6cacf50bd7bcdc4e70062e7913d09bed0cb7f9b3ddaf05c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_061017_932408_D438B4C8 
X-CRM114-Status: GOOD (  18.86  )
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

Hi Udit,

On 12/3/25 8:50 AM, Kumar, Udit wrote:
> 
> On 11/27/2025 2:08 PM, Thomas Richard (TI.com) wrote:
>> Implement the restore_context() operation to restore the clock parent
>> state. The parent index is saved in sci_clk struct during set_parent().
>> During clock registration, the core retrieves each clock’s parent using
>> get_parent() operation to ensure the internal clock tree reflects the
>> actual hardware state, including any configurations made by the
>> bootloader. So we also save the parent index in get_parent().
>>
>> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
>> ---
>>   drivers/clk/keystone/sci-clk.c | 25 ++++++++++++++++++++-----
>>   1 file changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/
>> sci-clk.c
>> index a4b42811de55d..1e5dd01484d1c 100644
>> --- a/drivers/clk/keystone/sci-clk.c
>> +++ b/drivers/clk/keystone/sci-clk.c
>> @@ -47,6 +47,7 @@ struct sci_clk_provider {
>>    * @node:     Link for handling clocks probed via DT
>>    * @cached_req:     Cached requested freq for determine rate calls
>>    * @cached_res:     Cached result freq for determine rate calls
>> + * @parent_id:     Parent index for this clock
>>    */
>>   struct sci_clk {
>>       struct clk_hw hw;
>> @@ -58,6 +59,7 @@ struct sci_clk {
>>       struct list_head node;
>>       unsigned long cached_req;
>>       unsigned long cached_res;
>> +    u8 parent_id;
> 
> you may need to restore rate as well

will do in v3.

> 
> 
>>   };
>>     #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
>> @@ -237,9 +239,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>>           return 0;
>>       }
>>   -    parent_id = parent_id - clk->clk_id - 1;
>> +    clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
>>   -    return (u8)parent_id;
>> +    return clk->parent_id;
>>   }
>>     /**
>> @@ -252,12 +254,24 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>>   static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
>>   {
>>       struct sci_clk *clk = to_sci_clk(hw);
>> +    int ret;
>>         clk->cached_req = 0;
>>   -    return clk->provider->ops->set_parent(clk->provider->sci, clk-
>> >dev_id,
>> -                          clk->clk_id,
>> -                          index + 1 + clk->clk_id);
>> +    ret = clk->provider->ops->set_parent(clk->provider->sci, clk-
>> >dev_id,
>> +                         clk->clk_id,
>> +                         index + 1 + clk->clk_id);
>> +    if (!ret)
>> +        clk->parent_id = index;
>> +
>> +    return ret;
>> +}
>> +
>> +static void sci_clk_restore_context(struct clk_hw *hw)
>> +{
>> +    struct sci_clk *clk = to_sci_clk(hw);
>> +
>> +    sci_clk_set_parent(hw, clk->parent_id);
> 
> You should restore,  if this is BOARD_CFG managed

restore_context() operation is called by clk_restore_context() for each
registered clock. And we call clk_restore_context() from ti_sci driver
only for BOARDCFG_MANAGED mode.

sci-clk driver cannot decide if clock context shall be restored or not.
Decision shall come from ti_sci as it knows the lpm mode.

Best Regards,
Thomas


