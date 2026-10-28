Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1280C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iT1UMT0r;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=S4vN2VHf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F0ZbMX9EeyLfy26pKyFOUMN1PmtyM/y56Mw7EBfzcA0=; b=iT1UMT0rstKz4d
	QOKyYQsajMpgEzEhlBxpEimWgBgzGAUDCpz/qYlOwgPZ8tpmFGNAXvJdgJKQDCCUbAEAu+ay470rc
	LUMHYOmhtmpdqw0IMNal2HFLUqqIpWxD7JypFSjHeB4UFxCPlIprCiktiVJL7H/wKqNVdhk2FmHLW
	vgGuDA+NcVpuGqoiAGyglD7uVutyeZ+aUk4yipgZ6VJ26Ch1lu/rQOgXLokjiUbXcTXNMHGvIsr5r
	OojWS5PHNkT2yEK+2jWLhZqROQf9hoTSeHri4eT0l9w9fJENrlrBhAkKPmkyIWdxlG4054YXXRd+s
	13tU+hxDyWQfqoIJNzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6aj-00000007XxN-0EBD;
	Wed, 28 Oct 2026 16:33:33 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6ag-00000007XwA-39wV;
	Wed, 28 Oct 2026 16:33:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7A2A167136;
	Wed, 28 Oct 2026 17:33:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793205206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=F0ZbMX9EeyLfy26pKyFOUMN1PmtyM/y56Mw7EBfzcA0=;
	b=S4vN2VHfYH/567vYQXf/ucDXOnWMiJ814HImMPur7WVAj5dxDevqFvw2rsuChHsm9izAVd
	DUbVFVZj7+uNVf+2gb/gRrTrMsbNDzVulLQz8KpmCsGB6xDV6Wx4uKhvgLE6xiZw0z1QI5
	S5t2G08BYUDoSLTfZHkE74XBJkp0G0/2FEmJEGSSMYAPVXi+uN8UbvKFMcwLXX49Zqq4MJ
	x9HxNYW/Zs3D0HILWMbXAb3BLQaWDx35BT3Un2+SRVji2hrZw56h/YACqwfBTln3un7jRj
	OF2piLTzT/wYcYIFAL8IYDht5/iF3+0JKyZK1PiupBn9mjI5vvEiL4ExQB7Q8w==
Message-ID: <c157df9e-b70e-4ba6-b808-5d13379b762e@cjdns.fr>
Date: Wed, 28 Oct 2026 17:33:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 0/7] net: dsa: mt7530: support EcoNet EN751221
To: Cristian Papa <pcristian292@gmail.com>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028160353.4239-1-pcristian292@gmail.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20261028160353.4239-1-pcristian292@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_093331_010227_022A95D1 
X-CRM114-Status: GOOD (  20.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Christian,


Thank you for testing!


On 28/10/2026 17:03, Cristian Papa wrote:
> Hi Caleb,
>
> I tested v3 on a TP-Link Archer XR500v v1 (EN7526G: on-die switch plus the
> MCM gigabit switch).
>
> Setup: OpenWrt with kernel 6.18.44. I took the four mt7530 files from
> econet_eth at 3a8bcd2e6398 (they contain every line added by 1/7, 3/7,
> 4/7, 5/7 and 7/7 of v3) and booted from RAM over TFTP, nothing written to
> flash.
>
> With the DT from en751221g.dtsi in openwrt#25330 (MCM "econet,en751221",
> no "mediatek,mcm", dsa,member <0 1> on the on-die switch and <0 0> on the
> MCM):
>
> - 18/18 boots: all 10 TRGMII lanes found a window, no "calibration
>    failed", "TRGMII inter-switch link initialized", DSA tree set up, ping
>    over lan4.
> - The chosen taps were stable across boots (+/-1): SoC->MCM 15-22,
>    MCM->SoC 27-29. In the SoC->MCM direction the window always starts at
>    tap 0.
> - 6 of those boots ran iperf3 for 6 s each way through lan4: 0 RX CRC
>    errors on on-die port 5 (~1.05M frames) and on MCM port 6 (~1.29M
>    frames). In 4 of 10 boots MCM port 6 already had 1 CRC error before any
>    traffic, probably from the calibration; it did not grow.
>
> Following the binding in 6/7, the MCM does not come up on this board:
>
> - "econet,en751221-gswitch": mt7530-mdio.c in 7/7 still matches
>    "econet,en751221", so nothing probes the MCM and there are no LAN
>    ports.


Whoops, I see I made an error on patch 7 and did not update the name to 
"gswitch", I will send a v4 soon.


> - "mediatek,mcm", which the binding requires for -gswitch: the probe
>    fails with "Couldn't get our reset line", since nothing provides an
>    "mcm" reset yet (the TODO in en751221g.dtsi).


Also expected as setting "mediatek,mcm" requires specifying the reset 
line, and reset for the MCM is on its own unique register and is not yet 
supported by en7523-clk.c reset controller. The OpenWrt implementation 
is a bit cheating by not bumping the reset line at all right now but in 
my testing it was not different when I manually bumped it so it seems 
okay for now


>
> So I think 7/7 should match the new compatible, and the binding should not
> require "mediatek,mcm" while there is no "mcm" reset for the EN751221.
>
> Not covered yet: cold boots, and the other LAN ports beyond link-up on
> lan3/lan4. I'm happy to give a Tested-by once the compatible strings line
> up, and to rerun anything you'd like; the full boot logs are available.


I'll send a v4 and I will synchronize the PR on OpenWrt to it so you can 
test easily.


Thanks,

Caleb


>
> Thanks,
> Cristian

