Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA88F557EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLGakkueiuUglii7S0JXozneE+o1ICSEReN85kCQkDU=; b=MKTmHPoF1lqDMtAsKqEl0lLbMs
	ArJuBK9p5OAakZmB4Ihf/OaM3R00gTuKT9mPBL6jy/i7hfmRArmToaG0mKjBkFzG4XtJVNZx0UIdz
	grk7Z/6Y0b+dS6Zr4nZX3CnM2mXtflDPcCwnViB37y1zBbNPfkLhkJAwI86SrMeRaIhIATlvA4NEX
	7CVc3HTTMJguNMkddUaEd9tzi2MUjOIJmQXMx7zpgdAVxJS7PtMpR+a7+VdVr2vRBfyj7nxxeAvIQ
	BSGNMZ3c1e+fAAb4ij4XH9I2OT80fBR720de4v5xp1tv4z80cb6MT05JDt11NkAf3I9wy0Yn7QQdV
	UgyWitLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkkd-00000006fBA-3xpg;
	Mon, 20 Apr 2026 09:17:07 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkka-00000006f9m-1tiO;
	Mon, 20 Apr 2026 09:17:06 +0000
Message-ID: <bb5ebce0-a59a-420c-a860-3cdb6b027372@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776676617;
	bh=dl5DcX6axaQB08bVzkfm0qYlVYMXHjs5k1QLohyagTg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TE8Fjf2KOVteTx9eiWJnuAJfefHqh30xeZHbwNfBd50KHHgITZ3wfIzcGFIlBB34B
	 KjKIiwxjFIPuGPWRHxggr5RrF1GbszM69AIijwMJ/j5TIzW+PMZlnvsHwy2Z4LI5kU
	 lqH9tkKhRdCzf2znN0ctIx6VB6ql9/MhiJCkCZJU=
Date: Mon, 20 Apr 2026 11:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
 <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
 <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
Content-Language: en-US
In-Reply-To: <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_021704_933940_0F8BDA0B 
X-CRM114-Status: GOOD (  15.38  )
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

Hi Jian,

On 4/20/26 5:25 AM, Jian Hu wrote:
> Hi Ronald,
> 
> 
> Thanks for your review.
> 
> On 4/17/2026 5:48 PM, Ronald Claveau wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hello Jian,
>>
>> On 4/15/26 10:33 AM, Jian Hu via B4 Relay wrote:
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the clock measure device to the T7 SoC family.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/
>>> arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> index 7fe72c94ed62..cec2ea74850d 100644
>>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>>> @@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
>>>                                status = "disabled";
>>>                        };
>>>
>>> +                     clock-measurer@48000 {
>>> +                             compatible = "amlogic,t7-clk-measure";
>>> +                             reg = <0x0 0x48000 0x0 0x1c>;
>>> +                     };
>>> +
>> Can you please order by reg, it should be between pwm_ao_gh and pwm_ab.
>> Thank you.
> 
> 
> According to the "Order of Nodes" chapter in Documentation/devicetree/
> bindings/dts-coding-style.rst,
> 
> nodes of the same type should be grouped together, and this takes higher
> priority.
> 
> So I have placed the clock-measure node after all PWM nodes to avoid
> splitting the PWM group.
> 

Thanks for your answer.

The documentation says nodes "shall be ordered by unit address" as the
primary rule.
The grouping by type is described as an alternative ("Alternatively"),
applicable to some subarchitectures, not as a rule that takes higher
priority.

So to me, I understand it as, unless your subarchitecture has an
established convention of grouping PWM nodes together, ordering by reg
remains the correct default here. And, in my opinion, sticking to a
single sorting method improves readability.


-- 
Best regards,
Ronald

