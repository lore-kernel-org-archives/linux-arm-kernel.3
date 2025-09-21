Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1412CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwONL9DDu35kJkqOi74CClmvm0OF7Yb0XK+wxyO0nYU=; b=dJs/kGa1KFYohOWR0kAarf7DNE
	sepPlEvGc/CwhABHjkrWwbu2O2/W6+GbtFAwdoDs9h2BWea3MM0RHyXVucSzzXyU8Hv2XyKGhAIKU
	Mos4Wd9/98sl1kD5i96vPBhfTu/0qBT/YbQ/yvGtstMrgl+h4dwfF1rlD/r06vmpkQ8XZmldgqsK5
	AHASTMwykOdgagC2Rn7Za6tvbk0fLnSS/m8mrpcX85kP4OqZiCT4+BsZFtNHVCz8ZdCaD/ClAlO8z
	16DkGdkQx7Oy5tIgGJTEOrh86HatHVJK7zbbeDX29pOMTsJlvB37H69QXN0YH5KFMkpwbTa/dkyWX
	IVlKF7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0KIv-00000007YQX-13cU;
	Sun, 21 Sep 2025 13:40:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0KIu-00000007YQM-1JQE;
	Sun, 21 Sep 2025 13:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACD35601D2;
	Sun, 21 Sep 2025 13:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD449C4CEE7;
	Sun, 21 Sep 2025 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758462035;
	bh=95QcD0HJijwOHoaQ6eyOQBU6JkvhnmTwXbdFW5nxPbM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DKgWQQZXjQN82L8kwgQ1cbiOIhuNq4crRXiki+UNkV3qaXbmI8jeQiebAsX9P3zpO
	 V91T12ukCZY9WgU+VsuNXfDS0hwayPluHpc5H3tWZV4/ci7xd0qpNf9MBvGyuBrZIA
	 qzHM1lnthrdQms+WHEs6qy/NvWYV5h+/8RJAtfIv7eKeC+M1P3c+Q6ibITQ+l4olyg
	 zTmZrVXhzWDqEUm0WGrmWRHLrk/VFI+YPj98lgcg8HXmKfMATUCcow5EmJPPQ7sgnI
	 oh8XKMRU2RB2ivVWxRBXC5TqO2KYDgdyi9LuAo1EAucj4CnPsyDIHGs4Wo54MeKJSP
	 jsOrImSzehm+Q==
Message-ID: <41bb000c-5643-4ed2-8d33-a6bd8a549409@kernel.org>
Date: Sun, 21 Sep 2025 15:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/22] usb: dwc3: Add Apple Silicon DWC3 glue layer
 driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-4-52c348623ef6@kernel.org>
 <20250919224016.gyao3aoka5ineear@synopsys.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250919224016.gyao3aoka5ineear@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 20.09.25 00:40, Thinh Nguyen wrote:
> On Sat, Sep 06, 2025, Sven Peter wrote:
>> As mad as it sounds, the dwc3 controller present on the Apple M1 must be
>> reset and reinitialized whenever a device is unplugged from the root
>> port or when the PHY mode is changed.

[....]

>> +/**
>> + * struct dwc3_apple - Apple-specific DWC3 USB controller
>> + * @dwc: Core DWC3 structure
>> + * @dev: Pointer to the device structure
>> + * @mmio_resource: Resource to be passed to dwc3_core_probe
>> + * @apple_regs: Apple-specific DWC3 registers
>> + * @resets: Reset control
>> + * @role_sw: USB role switch
>> + * @lock: Mutex for synchronizing access
>> + * @core_probe_done: True if dwc3_core_probe was already called after the first plug
>> + * @mode: Current mode of the controller (off/host/device)
> 
> For this platform, current mode of the controller should only ever be
> host or device mode. Seems we're mixing power with usb role? ie. what
> DWC3_APPLE_OFF is being used for?
> 

So this platform is very messed up and in order the bring up dwc3 and 
the PHY there are four steps:

1) The PHY itself has to be brought up; for this we need to know the 
mode (USB3, USB3+DisplayPort, USB4, etc) and the lane orientation. This 
happens from typec_mux_set
2) DWC3 has to be brought up but we must not touch the gadget area or 
start xhci yet
3) The PHY bring-up has to be finalized and dwc3's PIPE interface has to 
be switched to the USB3 PHY, this is done inside phy_set_mode.
4) We can now initialize xhci or gadget mode.

I think we can switch 1 and 2 but 3 has to happen after (1 and 2) and 4 
has to happen after 3.

And then to bring this all down again:

1) DWC3 has to exit host or gadget mode and must no longer touch those 
registers
2) The PHY has to switch dwc3's PIPE interface back to the dummy backend
3) The PHY itself can be shut down, this happens from typec_mux_set

We also can't transition the PHY from one mode to another while dwc3 is 
up and running (this is slightly wrong, some transitions are possible, 
others aren't but because we have no documentation for this I'd rather 
play it safe).

After both the PHY and dwc3 are initialized we will also only ever see a 
single "new device connected" event. If we just keep them running only 
the first device plugged in will ever work. XHCI's port status register 
actually does show the correct state but no interrupt ever comes in. In 
gadget mode we don't even get a USBDisconnected event and everything 
looks like there's still something connected on the other end.


And to make this all extra fun: If we get the order of some of this 
wrong either the port is just broken until a phy+dwc3 reset, or it's 
broken until a full SoC reset (likely because we can't reset some parts 
of the PHY), or some watchdog kicks in after a few seconds and forces a 
full SoC reset (I've mostly seen this with USB4/Thunderbolt but there's 
clearly some watchdog that hates invalid states).


So there's really no good way to keep dwc3 fully up and running after we 
disconnect a cable because then we can't shut down the PHY anymore. And 
if we kept the PHY running in whatever mode until the next cable is 
connected we'd need to tear it all down and bring it back up again 
anyway to detect and use the next device.


Instead, I just shutdown everything once a cable is disconnected and 
that's this DWC3_APPLE_OFF state. Maybe I can put the explanation above 
as a comment in there and maybe also rename "mode" to "state" here 
because we may get something like DWC3_APPLE_USB4_TUNNEL in the future 
here as well because the sequence might be a bit different there.



>> + */
>> +struct dwc3_apple {

[...]

>> +	/*
>> +	 * Note that we only bring up dwc3 once the first device is attached because we need to know
>> +	 * the role (e.g. host), mode (e.g. USB3) and lane orientation to bring up the PHY which is
>> +	 * tightly coupled to dwc3.
>> +	 */
> 
> The wording here is odd. You can wait for attach to do this, but it
> should not be a requirement. You might not know whether you need to
> switch role, but you should be able to initialize the controller in
> either host or device mode prior to attachment.
> 
> Any particular reason we need to do this? If not, we can do away with
> the core_probe_done condition.

Because I can't really bring up dwc3 fully to any mode without 
cooperation from the PHY and bringing it up here doesn't really buy us 
much (see above). What I could do here is already call dwc3_core_probe 
and then immediately dwc3_core_exit again to get rid of that condition.



Thanks,


Sven

