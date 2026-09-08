Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B080CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UX81FKHggDlYBKlQeaoEzIUHgB632Ksy7gdLpHI4rVY=; b=sN79ab/EggsA1CwL4YLR/Mb0ih
	s8PsXnAYjjxrJ5atyPr1UljXSuvRFU2QspH11uw7kHdsCVVEwImPF6v8MztFww/vcyJEIUEe6jtXe
	762SBgSYan5Q2ah12XyEt5f5YvvhWAhLara9aE75Aoyi4Md7cGNomwZNOv8J3E+Y50/kIhLghTJIg
	hWKx6C32d8w3Ye/enxee4bopTq/EWRxJbneV/CIGF9dGxt9NF8LYyDuiBKSWSCz8lxEcqf8ZlAbFF
	4V817meutrTyr6ep65o2Kp2rl+fvOn2fHEVwgSfoFQUXSiUE74OaPaU64r3ULPk99FvT6Ylljoi2r
	r/+h2eGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42Mt-0000000ABVk-3Nlx;
	Tue, 08 Sep 2026 20:24:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42Ms-0000000ABVI-1oYf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 20:24:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FD83601DE;
	Tue,  8 Sep 2026 20:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FF31F00A3A;
	Tue,  8 Sep 2026 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899073;
	bh=UX81FKHggDlYBKlQeaoEzIUHgB632Ksy7gdLpHI4rVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=n13BLIwJUvc/OQ5IesL7KDPLWb0H+mPh8H9Cy3ItVDb5BGON0ikp86TlzyYX7EaHR
	 3ePPwGuAnceTgnPER+uk8XpmI9RTdqctlshgC29YgNuiZoHhZ6cEP+/0mjsHF69Ycf
	 fAzuq0xDMnj/rJWwi0U5PqMfFrXX2cvN5v00YNvIzIxhQ8zWM7c/mhX+QnTAtBBpWT
	 ZU3jSm49HKaF6HjrwQPDrlsh9Iu1Ay1CKpMuvfpXfdKokzTGCbUyAt5OMjwatkpsk7
	 C3IpYx6T0VZoqFUM+e10ISLdebrmDk17Ae3XUifqAczThEmuBjdWAFZsCtA/SO67AN
	 bIxrG97DoV5qg==
Message-ID: <1b51428b-5dcd-4fdc-8f4e-d16ab14426a1@kernel.org>
Date: Tue, 8 Sep 2026 22:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] thunderbolt: Find Apple VSE capability during
 startup
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-usb@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
 Janne Grunau <j@jannau.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Mika Westerberg <westeri@kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
 Rob Herring <robh@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-11-1f80085f93fb@kernel.org>
 <DL94J88RKZ3S.2EX69YJ6JOX4P@ubuntu.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <DL94J88RKZ3S.2EX69YJ6JOX4P@ubuntu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 9/7/26 15:38, Joshua Peisach wrote:
> On Sun Sep 6, 2026 at 2:36 PM EDT, Sven Peter wrote:
>> Only Apple Silicon host routers have the Apple vendor-specific extended
>> capability. Look it up when the software connection manager starts and
>> store its offset in the root switch.
>>
>> The Apple NHI driver can then use the stored offset when programming
>> cable information without searching the router capabilities itself.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>  drivers/thunderbolt/tb.c      | 4 ++++
>>  drivers/thunderbolt/tb.h      | 2 ++
>>  drivers/thunderbolt/tb_regs.h | 1 +
>>  3 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index bf1c192ec10a..d2832323cc36 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -3025,6 +3025,10 @@ static int tb_start(struct tb *tb, bool reset)
>>          return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
>>                       "failed to allocate host router\n");
>>
>> +    ret = tb_switch_find_vse_cap(tb->root_switch, TB_VSE_CAP_APPLE);
>> +    if (ret > 0)
>> +        tb->root_switch->cap_vsec_apple = ret;
>> +
>
> Nitpick: I *think* based on the surrounding code that this can be
> simplified to "if (ret)"
>


No, ret < 0 is an error and if something goes wrong cap_vsec_apple must 
remain zero and not whatever errno tb_switch_find_vse_cap returned.


Sven


