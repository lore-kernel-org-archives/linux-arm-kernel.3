Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69356CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKUtByP6fF4AypeEupS0cYqkKaLgZeEGVKbSVhRby8E=; b=vSMU6g13l06C5MysoXMc/GRc7+
	9l/PfIo3bOqzhgGz9Nr/IXECVEgaAftLLuy6HHghaHncxCojfVUyG+ZllKC5bppACB0BXZW77BHlr
	Mk38eQ+QUobPuCgyuY7JryoSu+uoExxt8xJ2xh1g12xOReT5xD5B5ozWJn/+qIoXN2LsbxjugXw9F
	BSOUQE4otXSg87b14U5SJmk5ceFDRERjSObtVd4m9uoMgzCpsr/Nx3lJiBPKNfQdk0tQP5C6cPfXx
	ABtrNfduwYl98DZs8UBulMu+WXK/t9ajgTVyORpF2BOec6Y4NrScaSwOv+/bjAyoHYHlhVTW38nMR
	EQQtlTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwBT-0000000FRJS-0xvB;
	Mon, 18 May 2026 11:30:55 +0000
Received: from [2a02:6ea0:d71e::15] (helo=smtp.forwardemail.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwBP-0000000FRHP-2Xdr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1779103844;
 bh=oKUtByP6fF4AypeEupS0cYqkKaLgZeEGVKbSVhRby8E=;
 b=HrLofn58jRb1q0X59cjtaR8D8ZpdTYvs+bE0dk6ggDU6a65+Qfr2glEJuyFEZBam6+q6UkmkH
 OeEXVXh+h+VixNxytB3soJXXLhqKRPtnan44u6FX3J7w52Vqm5dlUQQ/C9Z6kzJFa4opW7BHwrE
 gkD9LDeeh0FvQmpCpuHdXA8puAyfUBVV7eB1aqZmxNbcVv6LP/iWG7P+WevX67UgLsIoF7ErRas
 eexW/UuINmwreW8A/TT5MjwBUTte3NE/GyDKmX44sjRVbCpp+Lcg/lC/fvYfKcdhmkekLn77FPY
 /g9zv5SL/JT+78M0WjdxBbIaVQK62EwIVBp6UiQwuQkQ==
X-Forward-Email-ID: 6a0af5de2fc1d62a42a3115f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b80598df-9fa0-4868-9704-075688786a92@kwiboo.se>
Date: Mon, 18 May 2026 13:19:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: rockchip: inno-hdmi: Add configure() and
 validate() ops
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260515195512.1757363-1-jonas@kwiboo.se>
 <20260515195512.1757363-2-jonas@kwiboo.se>
 <d69b500b-0473-496d-b17e-c60ce9839e0c@kwiboo.se> <agny1ER5j6om9hIT@vaman>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <agny1ER5j6om9hIT@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_043051_735636_73D49765 
X-CRM114-Status: GOOD (  23.43  )
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

On 5/17/2026 6:54 PM, Vinod Koul wrote:
> On 15-05-26, 23:04, Jonas Karlman wrote:
>> Hi,
>>
>> On 5/15/2026 9:55 PM, Jonas Karlman wrote:
>>> The commit 10ed34d6eaaf ("phy: Add HDMI configuration options")
>>> introduced a way for HDMI PHYs to be configured through the generic
>>> phy_configure() function.
>>>
>>> This driver derives the TMDS character rate from the pixel clock and the
>>> PHY bus width setting. However, no in-tree consumer of this PHY has ever
>>> called phy_set_bus_width() to change the TMDS character rate as only
>>> 8-bit RGB output is supported by the HDMI display driver.
>>>
>>> Add configure() and validate() ops to allow consumers to configure the
>>> TMDS character rate using phy_configure(). Fallback to the deprecated
>>> way of using the PHY bus width to configure the TMDS character rate.
>>>
>>> A typical call chain during DRM modeset on a RK3328 device:
>>>
>>>   dw_hdmi_rockchip_encoder_atomic_check():
>>>   - inno_hdmi_phy_validate(): pixclock 148500000 tmdsclock 594000000
>>>
>>>   dw_hdmi_rockchip_encoder_atomic_mode_set():
>>>   - inno_hdmi_phy_configure(): pixclock 148500000
>>>     - inno_hdmi_phy_validate(): pixclock 148500000 tmdsclock 594000000
>>>
>>>   vop_crtc_atomic_enable():
>>>   - inno_hdmi_phy_rk3328_clk_set_rate(): rate 594000000 tmdsclk 594000000
>>>   - inno_hdmi_phy_rk3328_clk_set_rate(): pixclock 594000000 tmdsclock 594000000
>>>   - inno_hdmi_phy_rk3328_clk_recalc_rate(): pixclock 594000000 vco 594000000
>>>
>>>   dw_hdmi_rockchip_encoder_enable():
>>>   - inno_hdmi_phy_power_on(): Inno HDMI PHY Power On
>>>   - inno_hdmi_phy_rk3328_clk_set_rate(): rate 594000000 tmdsclk 594000000
>>>
>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>> ---
>>> Changes in v3:
>>> - Change validate() ops to only validate tmdsclock
>>> - Add comments about expected consumer usage
>>> - Update commit message with a typical call chain
>>> Changes in v2:
>>> - Add validate() ops to validate that the TMDS rate is supported
>>> - Split out parts that remove the old workaround into a separate patch
>>>
>>> Patch "drm/rockchip: dw_hdmi: Configure HDMI PHY in atomic_mode_set()"
>>> at [1] adds phy_validate() and phy_configure() calls for this HDMI PHY.
>>>
>>> [1] https://lore.kernel.org/dri-devel/20260510183114.1248840-10-jonas@kwiboo.se/
>>> ---
>>>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 60 ++++++++++++++++++-
>>>  1 file changed, 59 insertions(+), 1 deletion(-)
>>
>> [snip]
>>
>>> +static int inno_hdmi_phy_validate(struct phy *phy, enum phy_mode mode,
>>> +				  int submode, union phy_configure_opts *opts)
>>> +{
>>> +	const struct pre_pll_config *cfg = pre_pll_cfg_table;
>>> +	unsigned long tmdsclock;
>>> +
>>> +	if (!(mode == PHY_MODE_HDMI && submode == PHY_HDMI_MODE_TMDS))
>>> +		return -EINVAL;
>>> +
>>> +	if (!opts->hdmi.tmds_char_rate || opts->hdmi.tmds_char_rate > 594000000)
>>> +		return -EINVAL;
>>
>> Sashiko reasoning log pointed out that a consumer of phy_validate() or
>> phy_configure() can make a call with opts=NULL, so I may likely send a
>> v4 of this series to fix such possible NULL pointer dereference here.
> 
> Yes please

I will send a v4 that includes a NULL check, thanks.

> 
>>
>> Or is that something that possible should be checked before phy core
>> calls the .validate()/.configure() ops?
> 
> The opts is an optional argument depending upon the mode to be valid. So
> we cant do that in the core...
> 
>>
>> Multiple other phy .configure() ops seem to dereference opts members
>> without any type of opts NULL check. (next-20260508)
> 
> We should fix these
> 
> 
> PS: Any reason why you are sending encypted emails?

Hopefully you find a way to read this :-)

My email provider tries to be smart and encrypts any outgoing mail when
there is a PGP key published for a recipient in a Web Key Directory,
something that kernel.org has [2].

I raised an issue with the provider and was hoping that the change they
made [3] would fix the issue, and it looks like your published PGP key
is not sign-only and is in fact encryption-capable.

Will open a new issue and ask them to add some way to fully disable use
of automatic encryption on outgoing mails.

[2] https://www.kernel.org/category/signatures.html
[3] https://github.com/forwardemail/forwardemail.net/commit/88def5438a8da678252c234e876d3cdd469a8202

Regards,
Jonas

