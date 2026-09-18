Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30713C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 05:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOQuQl4xHHsYUfV8IRt8LMVoVN43GEAALICbdkpOnwk=; b=2nWJNa8ULo+pG5ETJ+tuk2yAcM
	jfWzY4i9qlj54i1j1l9WzVWjQIw+xq1l4+QMzWsbP5e+M92B6hXQn3ouF2OyC+2xtSYEF+BXWkMBO
	VujLUswZ0tlCm5e6+ZPcGTzM6PL4gDDolhHvWvu17fjTgDg8rw1ikYGEIADIZYM285bbEk9h+Ugxs
	XnmW6QedNYer6uzD2ZVBSMlYbAmH7JmqZuUAoDSlvKfWhqK+/UMVarM9OBUtEhL2PbN233Lbpgkzp
	VoTcgi5Lbff5wpIahYVr3ipO2WWpSO42eCs1oGiByNdVIpTl3eZSUtEz+BXhjhCCkYXmYS06RXYXi
	/PG/cK6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RR8-0000000DW29-0Pda;
	Fri, 18 Sep 2026 05:47:02 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7RR4-0000000DW1n-3JI0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 05:47:00 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 75A69EC01E1;
	Fri, 18 Sep 2026 01:46:55 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 18 Sep 2026 01:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789710414;
	 x=1789796814; bh=vOQuQl4xHHsYUfV8IRt8LMVoVN43GEAALICbdkpOnwk=; b=
	c5GHBC89/s1hAHxNTUo8NCa7NKYdQyoxRykEfZyL49V+tNXU7S9IqENKUYYogY5u
	TrXxouQNJk+/ukGxgr9NknzN4BSCVi1vpR5efoqRYitejvjK5tf743bZF0XTTM5b
	dfX//JrDEeE5kPvJDagxX6DXDe4zxVABUUkjfL1SunTFEHESuilyakwK1n16zAUp
	r6e+OYfP4iuiBOgkshONPsKeF6230D4P0KYhQy0qnMmgGMC4uKaQgLn0L48LrOvc
	hIsOk5RZsp63UWcHkqEu0F1d4CSDeel9tcqqW7l4vNuMPDf/tEXBOFV3gOHuCUnk
	32DSwwP7YEJQzAso3MYmig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789710414; x=
	1789796814; bh=vOQuQl4xHHsYUfV8IRt8LMVoVN43GEAALICbdkpOnwk=; b=c
	wrMGDmHD5MmmDR3xs+YhVGGiybgFiVCH2vZ3SUf6aGtZhku0SSlYJH4/ErgJAuRj
	+1riSm/EamIGfl2Fxk8IOBX0Ac0NZ7Kuk1uj+LEg0V4dz9lnUkdlCxf3d6OsOk1q
	bzyPK0GWEzNoQi8A4zRdyAsVyVRi8vOe0HCc1f6ogix1AqTyOWjI4eEL8JYR8Ykc
	VEWrtwTVVCj1o2QJSDaB1W44kjc91ODT3+bfttEquCcj8jFsFOI37NsnRC9I7kFN
	SdBZRvi9dI45VMSbkXpefayq/qcn9Zgig5+h9E0bHJXvPNShF1I7HXo5rZEc369+
	3bU/wPioWzRe6rkWUifHw==
X-ME-Sender: <xms:SdCsaqg2_UVmxD2QC5Nl2F_uy1ndELKzOzO9NrVLSZd_p-m72Fs15Q>
    <xme:SdCsal0JWjpPUeMlNTQQET40FqTB2xpfDqCtdn88KlU-a9xFi8kTpXAXITIgvCC5d
    iJaLo9lWWbh9eatrF1hwh4vkHZcgFy60t8vE2W5fgNCT07r-WuwTU1C>
X-ME-Proxy-Cause: dmFkZTEYtRs0FMD0kTrhm17Art1N+H9Q4KIvT46UAFNPk7EDAm27bGjO2gB+rUw61KBpBc
    N/NOlpeBwTJV750SUVWhoqe465YW3OhPE7ybCjaKfhhSTQ4cUuPVRuWZUngKUruwRfYPn9
    /XKe+EiuHME6hif9UgDmQbEBUuXsGNOhyLiaHh06uObloHDh25jR69e4gfWbsYm6eCWiHT
    dNV1zwF3UIrYSoETX4EuMxaifvVZN9qCTQUsDFHwddpmb73lMFQKpKZt4Dev3MfR1hjD/s
    3Nzcoj6FPHAB02qFpS+loscNni7+4WNKnkQgBlDhkALW950KBLdQp+nSxBfGxU+w4gKbUO
    lycrwjZI3E2Ow/DqbTPEoj0glfcAtS/ADI91hAAjgMzku4/Yrwq+TDybw2h4OQ0KMzQTO7
    Ygu5W7hUt+fMR1Kg4c20ZSUsRKwFDVIwYE/oV+OmvzHeMr0bNkEC6JM6GDcZ417Ggk7IPb
    H1pOVj/4NAxHZ8+uK3SXL/w2xDr5mOo216qo3rDCJ60kQS4rp8K5yngJ1OVPEw/5D1eEpW
    nquPZMFIek4tpY/7dMK/RSTrbpQkNX89VvrNg/iOCl6jc5qoywlsSE/KKI3gIF8BEeB+Rp
    1YxzX7lycbnVGxe98b1dbxC9e4gIGw6G3u37DfyvlkTopr0wQ4s9mSUok7kA
X-ME-Proxy: <xmx:S9CsatF_qsk182wVJpA3lz2o5A86ug6hxGSGoe4pw0axhv3WJvd2hw>
    <xmx:S9CsarHNQrxA4dRP0cfZ9gtrgUIB4sGD0VXyO4dUVxEwfSFDrdTVLA>
    <xmx:S9Csat25CZVD6B_6lfV8t9NTEaEH4FWkTplIPkxxJwgAHIrN7_nCOw>
    <xmx:S9CsaldI95E6jk_5DVgVZLec53xnYDNQg-cFBbIQbHRoAc5cCWwPTw>
    <xmx:TtCsaipDFXDBPFz1X8UV0J2_D3uxYHL49Qb4-3inkgdWZNJehpr46lvW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3822632A0084; Fri, 18 Sep 2026 01:46:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1v-knPnKEnN
Date: Fri, 18 Sep 2026 07:46:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bjorn Helgaas" <helgaas@kernel.org>
Cc: "Semih Baskan" <strst.gs@gmail.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 bhelgaas@google.com, "Ray Jui" <rjui@broadcom.com>,
 "Scott Branden" <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Rosen Penev" <rosenp@gmail.com>,
 rani.hod@gmail.com
Message-Id: <8f36b2ea-38e0-4b57-86c9-9efef8fa8fa8@app.fastmail.com>
In-Reply-To: <20260917214801.GA1054958@bhelgaas>
References: <20260917214801.GA1054958@bhelgaas>
Subject: Re: [PATCH] PCI: iproc: Use pci_alloc_host_bridge() on BCMA
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_224659_330964_6DBAF68E 
X-CRM114-Status: GOOD (  17.69  )
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

On Thu, Sep 17, 2026, at 23:48, Bjorn Helgaas wrote:
> On Thu, Sep 17, 2026 at 10:27:54PM +0200, Arnd Bergmann wrote:
>> On Thu, Sep 17, 2026, at 20:36, Bjorn Helgaas wrote:
>> 
>> It feels wrong to me to change the devicetee file when that arguably
>> describes the device correctly, and we still need the node for the
>> bcma bus probe in the end.
>
> I don't think pcie-iproc-bcma.c needs anything from DT at all.
> Everything it needs is in EROM.
>
> Some PCI drivers, e.g., wifi, need DT nodes, and I think those need to
> be enclosed in a node for the PCI host controller, but
> pcie-iproc-bcma.c itself doesn't care.

I understand that it just works without that, my only concerns is
that having a DT node (which is required for adding child nodes)
without a compatible string is going to cause problems later,

From the DT perspective, it would be better to add a second
(or third) compatible string to identify the device better and
keep the existing generic string as a fallback. The
pcie-iproc-platform driver can then skip the device based
on the more specific string.

Simply replacing the existing compatible string with a new one
would solve the probe order problem and at least leave a
well-formed device node, but this would still count as an
incompatible binding update, which we try hard to avoid.

        Arnd

