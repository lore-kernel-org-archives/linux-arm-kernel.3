Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D11CF557F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 09:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vf+u1NkrE4//YAJpx8uibbTldrRhuUatPoLH+Nf7Xa8=; b=jlHRmueCFotZBoJIU7jjHaxRo1
	1PkceeMf3/olj7uhZn1bKWvn68ZZSH9OUCcClBbe6+uf4trKSdDzVAY9pjRXHWZ/v0m+lxzg+nTCQ
	ItPILfRi1BjhMqfB8lW/erqX3GkNogpx8f/GCkI7bFzPB7mIflxH5IRySX5kAnFNE3ccZJhX4OTn3
	zUvlknu/CJY0Je6KS1L3KaH6TIwbxGky2WobofbA99qTSt2YjODeWWznkPnfyJvByydWyHhDvPX0W
	S4BiONi5OmTeKfKnXaQqpcj9t231UuN9nQCLumZY+sZF+ty7TC1l9if1XZcm2M2d+RLbed5UQOvC+
	hxtsDPow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEl2K-00000006gXC-0BMC;
	Mon, 20 Apr 2026 09:35:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEl2H-00000006gWr-2e9B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 09:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD22741841;
	Mon, 20 Apr 2026 09:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C961C19425;
	Mon, 20 Apr 2026 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776677720;
	bh=ie4pHq24hX87Ox/y+xM4soh8D6peU7BX9IY2UXo6tvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iV9s2VE7d9sBsBuzGHLRNE26Z22EnHXTiJ4oB0tzlYLUsoh7adXQjrGiO64itbhCZ
	 Om6gFOOYbUfzpwhvKwAkzv7SRRB8Bi+81ZYByhhaH8AiyYH/py4Wz+GULEuUIgdj44
	 WKkH3tlPvTs0mit1v59bSBi7j3dbvmgImK/GONTje2t5eucckT0rrUcSO35nDE25mN
	 8P/w+UqUlb9QyQApZK93jcQoxTEhKrhxyos1w7O81m/iWpXnxDYVP5nWiN5kmwEdts
	 /UndC8ta1PzkwWXmoCWTM6O14Hpsx9uqN8KQS69u+ON8rvUss13OSrJvZDwtFlfHsB
	 q5FIQySjmrYvw==
Date: Mon, 20 Apr 2026 15:05:06 +0530
From: "mani@kernel.org" <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	Hongxing Zhu <hongxing.zhu@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V13 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <nwoyko5feezkakwjjgwdbpwrlv7a3e72avux36t72uzp5mc2x7@26q7fnpvwupe>
References: <VI0PR04MB1211449884AC3BC8E3711F1AB92202@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <20260417195533.GA92707@bhelgaas>
 <viggqsxczf5d5hok4qpqhknalwb46xapsgdxbbgbqhruhyn2hn@wtck4yajmuw7>
 <VI0PR04MB12114304913B6AACF6A206E10922F2@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB12114304913B6AACF6A206E10922F2@VI0PR04MB12114.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_023521_767287_EAE32074 
X-CRM114-Status: GOOD (  20.75  )
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

On Mon, Apr 20, 2026 at 08:24:57AM +0000, Sherry Sun wrote:

[...]

> > Even if there are PERST# GPIOs from the host, connected to downstream
> > ports of a PCIe switch, they could be stored in the Root Port's (pci_host_port)
> > struct as a list of PERST#. This is what pcie-qcom driver does.
> > 
> > It is too clumsy to handle PERST# individually for each device. We tried it
> > before with pwrctrl, but it always ended up biting us on who gets to control
> > the PERST#. We can't let pwrctrl handle PERST# for a switch port and host
> > controller driver handle it for RP. And we cannot let pwrctrl handle PERST# for
> > all ports, because, host controller drivers also need to control them for RC
> > initialization.
> > 
> > That's why it was decided to handle PERST# for all ports in the host controller
> > drivers. So following that pattern, this helper could also be extended to parse
> > the PERST# from all ports defined in DT and store them in the same Root Port
> > struct.
> > 
> > It should be trivial to implement this logic in the current helper. @Sherry:
> > Could you please implement this logic?
> 
> Hi Mani, do you mean the similar logic in this patch?
> https://lore.kernel.org/all/20251216-pci-pwrctrl-rework-v2-1-745a563b9be6@oss.qualcomm.com/
> If yes, of cause I can do this for current helper functions in pci-host-common.c.
> 

Yes!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

