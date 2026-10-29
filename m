Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A1A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 02:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tKw6NiTW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fq8Ce5SY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4cOh5ydFl01OU2B+rC207B1abgz09QduO3g9/V7orkQ=; b=tKw6NiTWp47hsktkAxDgDz0X9W
	0jXOADdT34362B4/e1K5n8F+7p6S/OSerFRbAnaV8jtlXA3G1masw4UB8EUPmtJRI4rPgp71+jX0b
	JYiXvye1/iyYB0tZIcEIJ+AxzDZja9ZViZq1Mx3kuQFnIe/9Jw7Rl/lOEKcMKgI6lBLHZ/nuXmr43
	dKcVYExvPWlVreibvMYeBshPVHG6+y9qIf/2UTi6ajQkAN6LoltqVZvJoxBVuHKU00Fr7K/lBgj5g
	v/1os59kmCk1a3NgnpYoaQX11p6inCpRu49w54yWJuD6cGSbuiEJDWl2m7nmCgaCsfm0EdTPDEvSA
	6b3KFxIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFTa-00000008AaK-1Lps;
	Thu, 29 Oct 2026 02:02:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFTT-00000008AXf-2V5O;
	Thu, 29 Oct 2026 02:02:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A35843CB2;
	Thu, 29 Oct 2026 02:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F3C1F031E1;
	Thu, 29 Oct 2026 02:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793239359;
	bh=4cOh5ydFl01OU2B+rC207B1abgz09QduO3g9/V7orkQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fq8Ce5SYBJjzwaICyFdWDMIxo7tyMKs3IiuFfF/drrqy2f36QwHpfb5LGFc5M3SLq
	 WGP4VeuFau7DtIAtOiwYXbT+f/g4LwD5lMmTzVTkNqWgQ1o4rhb0bS1PtD3XZqad1O
	 2/UjlkZh9jj8XH1zj7OGpEePE4Yonu9pvHfy0uzT0f4ntL33eFFk/sFYloOF+48DHq
	 Zttzg/Yxo9Scph3mYQzvHCdzgkbxId9TRft+RgqqlnytlZ3zoQ+F6g56F6n03ToSTf
	 oa0zEuY6qQcciCIzHepDlH0FPxAKuEkrkZSJDSMjKLnbBg7x1CgbWQ0elJL0J8NuTO
	 XQKwlnTD2o2JA==
Subject: Re: [PATCH v3 2/7] dt-bindings: net: dsa: mediatek,mt7530: add
 passthrough mode
From: netdev-bot+sashiko@kernel.org
To: cjd@cjdns.fr
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Date: Thu, 29 Oct 2026 02:02:37 +0000
Message-ID: <179323935725.3134.9897775788252590471@kernel.org>
In-Reply-To: <20261028011317.1557238-3-cjd@cjdns.fr>
References: <20261028011317.1557238-3-cjd@cjdns.fr>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,T_SPF_TEMPERROR autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The binding tells DT authors to model passthrough as a two-
  switch DSA cascade ('the upstream switch is configured with a DSA link…
- [Low] The passthrough paragraph added to the description of
  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml (lines…

--

dt-bindings: net: dsa: mediatek,mt7530: add passthrough mode

This commit documents a "passthrough" mode for MT7530/MT7531 switches in
the mediatek,mt7530 binding description. In this mode the upstream switch
forwards traffic between its CPU port and a DSA link to a downstream
switch, and it does not alter the MediaTek tag.

> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 90b3582b76190..e29fb86934981 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -73,6 +73,13 @@ description: |
>  
>        Check out example 7.
>  
> +  The MT7530 and MT7531 switches are capable of being operated in "passthrough"
> +  mode. In this mode, traffic is unconditionally passed between the CPU port
> +  and the DSA port which links to a second switch. To use passthrough mode, the
> +  upstream switch is configured with a DSA link to the downstream switch. In

[Severity: Medium]
Should this also say which DSA switch index each switch has to use?

The MediaTek tag carries only a 3-bit source port and no switch ID.
mtk_tag_rcv() always looks the port up on switch index 0:

net/dsa/tag_mtk.c:mtk_tag_rcv() {
    ...
	port = (hdr & MTK_HDR_RECV_SOURCE_PORT_MASK);

	skb->dev = dsa_conduit_find_user(dev, 0, port);
	if (!skb->dev) {
		kfree_skb(skb);
		return NULL;
	}
    ...
}

dsa_conduit_find_user() only matches DSA_PORT_TYPE_USER ports on the
given switch index. In passthrough mode the upstream switch forwards the
downstream switch's tag unchanged, so port is a downstream port number.

The two switches can't share an index, because
dsa_switch_parse_member_of() returns -EEXIST for a duplicate.

Take a DT that uses the natural ordering: the CPU-facing upstream switch
at dsa,member switch index 0 and the downstream switch at index 1. Would
every received frame then be looked up on the upstream switch?

That switch has no user ports in passthrough mode. The lookup would
return NULL and the frame would be freed, so all RX traffic on the
downstream user ports would be lost.

No later patch in the series seems to change this. tag_mtk.c is
unchanged, the driver doesn't touch ds->index, and the final binding has
no passthrough example or dsa,member guidance.

Could the text say that the downstream switch must be switch index 0 in
dsa,member and the upstream switch must use a non-zero index? An example
showing this would also work.

> +  passthrough mode the upstream switch is restricted, with no other ports or
> +  switch configuration allowed.

[Severity: Low]
These topology rules are stated only in prose. Could they be encoded in
the schema as well?

Ports match ^(ethernet-)?port@[0-6]$ with additionalProperties: true.
The per-port reg and phy-mode rules apply only to ports that have an
ethernet property. Those rules are the top-level if: required:
[ ethernet ] block and the builtin-dsa-port, mt7530-dsa-port and
mt7531-dsa-port $defs.

As a result, a port with a link phandle on the upstream switch gets no
reg or phy-mode check. A node with extra user ports next to the CPU and
link ports also passes dt_binding_check.

mt753x_check_passthrough() in the driver does reject that case at probe
with "Only two ports allowed in passthrough mode". The schema does not.

The port reg description still reads:

    Port address described must be 5 or 6 for CPU port and from 0 to 5
    for user ports.

Should it mention DSA link ports too?

Later in the series, "dt-bindings: net: dsa: mediatek,mt7530: add
econet,en751221" adds mt7530-passthrough-dsa-port, which requires the
link port to be reg 6 and trgmii. That $def applies only to the
downstream econet,en751221-gswitch. The upstream econet,en751221-switch
uses builtin-dsa-port, so its link port is still unconstrained.

There is also a small wording mismatch. The commit message says:

    MT7530 switches can be configured to blindly pass packets between their

but the binding text says "The MT7530 and MT7531 switches". Could these
be made to match?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261028011317.1557238-1-cjd%40cjdns.fr

