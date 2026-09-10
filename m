Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C4BC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKin1QGY55AdPgTixeORacbQDYMT7clJ8zzHZH3TRxU=; b=140TYjqghqbeQmzxmjQY64R7h7
	I28uQclRsdR1jDJ6cUb+MTiOwwboeox+6ZaFrEE3b7FS3+JygyfD7abY4WQAW9o3JoUtp0jjVoVma
	RVDT3zdGsYqAwv39Paiu2acYEWgZCPJuyq9JQj4x1IpglspHZkAOI+ZCW8uAStZN/i3dqbjOfRUX+
	66gr+hr66pTLL6bW06b0ob/DiQkkEs1hG+uQEvKapzCLSNn36ZRCLQcBvzM54jdkULADg7R7CMYb+
	94URvjuZyPpZiGRP7kW6M9YvUmklia0EiB8syyw2+3i8Gze/u5Q8DMqqiW7g+o5Fnfw3xGQ6FQbgk
	Fn8j2xMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oTE-0000000FZRD-1iQK;
	Thu, 10 Sep 2026 23:46:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oT1-0000000FZJo-0pu2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:46:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC2AB4478C;
	Thu, 10 Sep 2026 23:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53A31F000FF;
	Thu, 10 Sep 2026 23:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083966;
	bh=bKin1QGY55AdPgTixeORacbQDYMT7clJ8zzHZH3TRxU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Oj1dAledzlSEwNYwopD1K06wGLKiF/sVSFe7ThSheP5BfClxudH7mPJ5bxT8n2qyJ
	 /xiOWxQz4V+bpbMHaqz4nao5+MAGYJirq19/A1lq7pI/TzhNLlqUoydth5ctavc24U
	 R9VJHgsdhg+IPSZ3g9PXrhO/ekK3Glh03jZrPOJFueHPW9SqWKBRZ0taUQJw/EuwTE
	 JBssvdhxwD+DNHhVoCFWEIZrnzKhrc1BxUesEJF/biM8WPXW4+0Qii54EDaEcEn30s
	 VG7RjDWG4JXwz8QOOdBPAhhWvVs2RbEfto/ebdlAcV7VXmIcjEatcuxejOHnoKaFq7
	 zdOA97CgNAo7Q==
Subject: Re: [PATCH net v4 7/7] selftests: drv-net: Add VLAN test
From: netdev-bot+sashiko@kernel.org
To: ovidiu.panait.rb@renesas.com
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 23:46:05 +0000
Message-ID: <178908396551.219967.6360903882566438769@kernel.org>
In-Reply-To: <20260908164309.59282-8-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-8-ovidiu.panait.rb@renesas.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] vlan.py's 802.1ad/QinQ matrix never requests the one feature
  combination in which the QinQ mis-stripping bug the commit says it…
- [Low] test() calls cfg.require_ipver("4")
  (tools/testing/selftests/drivers/net/hw/vlan.py:94) although the test…

--

selftests: drv-net: Add VLAN test

Adds tools/testing/selftests/drivers/net/hw/vlan.py, which pings over
802.1q, 802.1ad and QinQ VLAN interfaces with hardware RX VLAN stripping
toggled on and off, plus the Makefile and config entries for it.

A couple of questions about the variant matrix and the environment
requirement below.

> diff --git a/tools/testing/selftests/drivers/net/hw/vlan.py b/tools/testing/selftests/drivers/net/hw/vlan.py
> new file mode 100755
> index 000000000000..61fa452b95bd
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/hw/vlan.py
> @@ -0,0 +1,112 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0
> +
> +"""
> +VLAN tests.
> +
> +Validates that ping traffic is sent and received correctly over 802.1q
> +and 802.1ad VLAN interfaces, with hardware RX VLAN stripping enabled and
> +disabled on the local interface.
> +

[ ... ]

> +def _vlan_setup(base, addr, outer_proto, inner_proto, host=None):
> +    """Create VLAN interfaces on base and set an IP on the innermost one."""
> +
> +    _vlan_add(base, OUTER_DEV, outer_proto, OUTER_VID, host=host)
> +    if inner_proto:
> +        _vlan_add(OUTER_DEV, INNER_DEV, inner_proto, INNER_VID, host=host)
> +
> +    dev = INNER_DEV if inner_proto else OUTER_DEV
> +    ip(f"addr add {addr}/24 dev {dev}", host=host)
> +
> +
> +def _setup(cfg, outer_proto, inner_proto, hw_strip):
> +    """Configure VLAN stripping and create the VLAN interfaces."""
> +
> +    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> +    feats = {"rx-vlan-offload": hw_strip}
> +    if outer_proto == "802.1ad":
> +        feats["rx-vlan-stag-hw-parse"] = hw_strip
> +    set_ethtool_feat(cfg.ifname, feat, feats)

[Severity: Medium]

Does this combination actually reach the QinQ mis-stripping case the commit
message says the test aims to catch?

In _setup() both rx-vlan-offload and rx-vlan-stag-hw-parse are driven to the
same hw_strip value, and _vlan_variants() only yields all-on and all-off
combinations. The combination rx-vlan-offload=on with
rx-vlan-stag-hw-parse=off is never requested.

On a device where NETIF_F_HW_VLAN_STAG_RX is fixed off, set_ethtool_feat()
raises before running any ethtool -K:

tools/testing/selftests/drivers/net/lib/py/feat.py:set_ethtool_feat() {
	...
		if current[name]["active"] != state:
			no_change = False
			if current[name]["fixed"]:
				raise KsftXfailEx(f"Device does not support {name}")
	...
}

So the whole 8021ad_hw / qinq_hw variant is skipped, including the
rx-vlan-offload=on part which is settable on those devices. The surviving
8021ad_sw / qinq_sw variants then force rx-vlan-offload off.

That leaves no 802.1ad or QinQ ping running with hardware C-tag stripping
active. Wouldn't a driver that strips the first VLAN tag regardless of TPID,
reporting an 0x88a8 tag as a C-tag, still report "ok 8021ad_sw" and
"ok qinq_sw" here? The sample TAP output in the commit message shows exactly
this on st_gmac, and netdevsim likewise advertises only
NETIF_F_HW_VLAN_STAG_FILTER and not NETIF_F_HW_VLAN_STAG_RX in nsim_setup().

Should the 802.1ad/QinQ variants instead be split so that rx-vlan-offload=on
is requested independently of rx-vlan-stag-hw-parse, so a fixed
rx-vlan-stag-hw-parse does not remove the hardware stripping coverage?

Related, the docstring says:

  Validates that ping traffic is sent and received correctly over 802.1q
  and 802.1ad VLAN interfaces, with hardware RX VLAN stripping enabled and
  disabled on the local interface.

and the commit message says the three configurations are covered "each with
hardware RX VLAN stripping enabled and disabled". Could these be reworded to
match what happens on devices where rx-vlan-stag-hw-parse cannot be changed?

> +
> +    _vlan_setup(cfg.ifname, LOCAL_IP, outer_proto, inner_proto)
> +    _vlan_setup(cfg.remote_ifname, REMOTE_IP, outer_proto, inner_proto,
> +                host=cfg.remote)
> +
> +
> +def _vlan_variants():
> +    """Generator that yields the VLAN protocols and the stripping mode."""
> +
> +    yield KsftNamedVariant("8021q_hw", "802.1q", None, True)
> +    yield KsftNamedVariant("8021q_sw", "802.1q", None, False)
> +    yield KsftNamedVariant("8021ad_hw", "802.1ad", None, True)
> +    yield KsftNamedVariant("8021ad_sw", "802.1ad", None, False)
> +    yield KsftNamedVariant("qinq_hw", "802.1ad", "802.1q", True)
> +    yield KsftNamedVariant("qinq_sw", "802.1ad", "802.1q", False)
> +
> +
> +@ksft_variants(_vlan_variants())
> +def test(cfg, outer_proto, inner_proto, hw_strip):
> +    """Run a single VLAN test"""
> +
> +    cfg.require_ipver("4")

[Severity: Low]

Is this requirement needed? The test never uses the environment's IPv4
endpoint addresses: _vlan_setup() installs its own 198.51.100.1/24 and
198.51.100.2/24 on the newly created VLAN devices and the ping goes between
those.

NetDrvEpEnv.require_ipver() skips unless both the local and remote address
for that version were configured:

tools/testing/selftests/drivers/net/lib/py/env.py:require_ipver() {
	if not self.addr_v[ipver] or not self.remote_addr_v[ipver]:
		raise KsftSkipEx(f"Test requires IPv{ipver} connectivity")
}

So an environment configured with only LOCAL_V6/REMOTE_V6, which
_check_env() accepts, skips all six variants even though the base ifname,
the remote ifname and the test's own VLAN addressing are all available.

drivers/net/macsec.py does the same 198.51.100.x-over-VLAN ping in
_setup_vlan_ips() without calling require_ipver(). Could the call be dropped
here as well?

> +
> +    _setup(cfg, outer_proto, inner_proto, hw_strip)
> +
> +    cmd(f"ping -c 1 -W 5 {REMOTE_IP}")

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908164309.59282-1-ovidiu.panait.rb%40renesas.com

