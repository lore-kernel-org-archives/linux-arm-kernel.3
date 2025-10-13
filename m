Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA36CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 02:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvpR+5epSgdAGZf25SgOvURV9dCVLjxkFsGadPU1WfE=; b=cOccECCHXIwy2cmNiZkQ6Fsv8j
	ybd2R+0B/BiyfMT10lqzZNdvEbQHyB/OCxtqLOXJ8QGaEe+C4thkFTJ5cojpM2AyWIaCeCqZcdFje
	fRyB51FFA5XnLtZXtnwLw7V9sj2/QdOiiw7D/VNdmdEoeFob3djcLthDPvk/vixwRtTdfjfwcK8E3
	Dds/kaXbMPiL4CpIRpTjvBkFFwL7GgxOMGenT9OIvKd5cOR/Tfu6nq31sRsJ0Km4o1HUszdCepkmS
	blHBn2ok+P33G3sFp3F5nW9tQANAC+IHXLcMbIPiG4t7OQgBxiLItKhqUKxCphwUihClN8CdbHpIL
	G2AxDKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v88Yh-0000000C7O7-08QN;
	Mon, 13 Oct 2025 02:45:11 +0000
Received: from mail-m32113.qiye.163.com ([220.197.32.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v88Ye-0000000C7Mr-03CR;
	Mon, 13 Oct 2025 02:45:09 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 25a6fe6cd;
	Mon, 13 Oct 2025 10:44:59 +0800 (GMT+08:00)
Message-ID: <ca57d854-efd1-42b8-9c25-33b01aaf1065@rock-chips.com>
Date: Mon, 13 Oct 2025 10:44:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-7-kernel@airkyi.com>
 <qzcdulyj2enho7l6vyvad7ln46zk2u4z7rnsjv2nv4tbw5j6jf@6oenbixoh3sp>
 <08eb7560-c13e-462f-8110-d4ce5ccbd687@rock-chips.com>
 <6hilafgpdbsppeeib75b5uamwf22kbu4likcp64ahb4u7zehhw@c3mtlzwx7qcp>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <6hilafgpdbsppeeib75b5uamwf22kbu4likcp64ahb4u7zehhw@c3mtlzwx7qcp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99db74f55503abkunm46b4331dfb5aa5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9DT1ZLSh9DGB5DSU1PHRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=AdWLh2ZxxKiOLp3FP40kGgGqVwvx1gdP7V9lKWIjP1uZ1bP1cVXxZBe7R674SimMp6W9XjTp3k1sL4Y4mC1b2Tjon4D2FK/n3+hxe4yewtMaYcMzx4TUe2PVgFCMh/I3Y2biNL2Oxw6oAAzt8A4GFeVT1kuJjMutM7t4ZkQC9pY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=HvpR+5epSgdAGZf25SgOvURV9dCVLjxkFsGadPU1WfE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_194508_527827_5D809F59 
X-CRM114-Status: GOOD (  19.88  )
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

On 10/13/2025 10:11 AM, Dmitry Baryshkov wrote:

> On Mon, Oct 13, 2025 at 09:26:06AM +0800, Chaoyi Chen wrote:
>> On 10/12/2025 2:52 AM, Dmitry Baryshkov wrote:
>>
>>> On Sat, Oct 11, 2025 at 11:32:31AM +0800, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
>>>> the CDN-DP can be switched to output to one of the PHYs. If both ports
>>>> are plugged into DP, DP will select the first port for output.
>>>>
>>>> This patch adds support for multiple bridges, enabling users to flexibly
>>>> select the output port. For each PHY port, a separate encoder and bridge
>>>> are registered.
>>>>
>>>> The change is based on the DRM AUX HPD bridge, rather than the
>>>> extcon approach. This requires the DT to correctly describe the
>>>> connections between the first bridge in bridge chain and DP
>>>> controller. For example, the bridge chain may be like this:
>>>>
>>>> PHY aux birdge -> fsa4480 analog audio switch bridge ->
>>>> onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
>>>>
>>>> In this case, the connection relationships among the PHY aux bridge
>>>> and the DP contorller need to be described in DT.
>>>>
>>>> In addition, the cdn_dp_parse_hpd_bridge_dt() will parses it and
>>>> determines whether to register one or two bridges.
>>>>
>>>> Since there is only one DP controller, only one of the PHY ports can
>>>> output at a time. The key is how to switch between different PHYs,
>>>> which is handled by cdn_dp_switch_port() and cdn_dp_enable().
>>>>
>>>> There are two cases:
>>>>
>>>> 1. Neither bridge is enabled. In this case, both bridges can
>>>> independently read the EDID, and the PHY port may switch before
>>>> reading the EDID.
>>>>
>>>> 2. One bridge is already enabled. In this case, other bridges are not
>>>> allowed to read the EDID. So we will try to return the cached EDID.
>>>>
>>>> Since the scenario of two ports plug in at the same time is rare,
>>>> I don't have a board which support two TypeC connector to test this.
>>>> Therefore, I tested forced switching on a single PHY port, as well as
>>>> output using a fake PHY port alongside a real PHY port.
>>>>
>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>> ---
>>>>
>>>> +	/* One endpoint may correspond to one HPD bridge. */
>>>> +	for_each_of_graph_port_endpoint(port, dp_ep) {
>>>> +		struct device_node *phy_bridge_node __free(device_node) =
>>>> +			of_graph_get_remote_port_parent(dp_ep);
>>>> +
>>>> +		bridge = of_drm_find_bridge(phy_bridge_node);
>>>> +		if (!bridge) {
>>>> +			ret = -EPROBE_DEFER;
>>>> +			goto out;
>>>> +		}
>>>> +
>>>> +		dp->hpd_bridge_valid = true;
>>>> +		dp->hpd_bridge_list[count].bridge = bridge;
>>>> +		dp->hpd_bridge_list[count].parent = dp;
>>>> +		dp->hpd_bridge_list[count].id = count;
>>> This looks misnamed. They are not necessarily HPD bridges. There can be
>>> a random chain between your controller and the actual output / connector
>>> /etc.
>> Yes, and more precisely, this should be `pervious_bridge_list` . Will fix in v6.
> I think the typical convention is around next_bridge, not previous.

Oh, that's true.  Will fix this in v6.


>
>
-- 
Best,
Chaoyi


