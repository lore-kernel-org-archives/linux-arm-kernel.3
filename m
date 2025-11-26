Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860FBD10F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBVNER9L9oV3VRDlonWtyD3NWeY+HyYBe1TaqmaWD3Q=; b=Xur88gaDS7pd6VK0Kra30o13NA
	5IEiPhUbnznOinkygRLPZEGTef8fabcg4vDAQItoBe8rkuLQTu0aCKNzXNYCc9i4RGNgCEix1rdoA
	Ot1J6o5IjdcFDOIyEQVyotkHPjysOytRt/9JjspfcAR7IahgwLK11F+TFwTFbVrjOqN9TGa/CPL5L
	X+cEiYXu/e1G1SsvzjqYlHnNKMhBQpaQwRBx8tQUlwJgF29CxAVkmnCLaT6XmIfBIs+xjPtwPU4gz
	tgdUE/Z0dv2Ma5ov0vp1zrTzjtZDfmvJ5RfHuBwSJHpL9fwAaqCznmkpsfFGwdXU7aavcx7+Uno7C
	hPh3/1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFyZ-0000000F3zd-19CP;
	Wed, 26 Nov 2025 13:54:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFyW-0000000F3zS-2K0a;
	Wed, 26 Nov 2025 13:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFB17601A6;
	Wed, 26 Nov 2025 13:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41F0C4CEF7;
	Wed, 26 Nov 2025 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764165267;
	bh=65eP/lbRfzZhiS3efIMJ0dY3HA+WW/ppdXfaAdFXkXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXGloj682brw4JG9ho9TLCbP6OZOgbIAdWrbM83Y1+iW88vaXKENgqq87df2en3mV
	 +8zv1bQG2I92tKoSuoDzMUTC0uzlqs0tFHYm/1G4Q8R80bu9glzVIUJxoT5dOhHSgA
	 TosUxL9eSMeVVtz+265ZiVNcigHqDJYGsIJgVhaBN+YRQazc37LvJi244kGJgE+0do
	 vdj919xaDkRYIVCDIA9ty+Uf7wRSuDV4neXBF3SF85fUW4cKfwiJpuhQDAGVKrHMJd
	 hFHbaWSq0DUpb50dhfWyT2CVMJgqqBm9mLuUTVxa0+kaELIPv4FxRmvul8D5zk2ZXt
	 +fbUEcZH5JRvw==
Date: Wed, 26 Nov 2025 19:24:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
Message-ID: <pbcemex3hdu4ryw2r7iy6xxt3chwaytlm2eina7mm4ukjfcagt@x4777z7ral26>
References: <20251111105100.869997-8-cassel@kernel.org>
 <mt7miqkipr4dvxemftq6octxqzauueln252ncrcwy6i2t7wfhi@jtwokeilhwsi>
 <aSRli_Mb6qoQ9TZO@ryzen>
 <7667E818D7D31A4E+cf7c83d4-b99c-469d-8d46-588fc95b843f@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7667E818D7D31A4E+cf7c83d4-b99c-469d-8d46-588fc95b843f@radxa.com>
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

On Wed, Nov 26, 2025 at 10:30:06PM +0900, FUKAUMI Naoki wrote:
> Hi Niklas,
> 
> I apologize for the delayed response.
> 
> On 11/24/25 23:02, Niklas Cassel wrote:
> > On Mon, Nov 24, 2025 at 06:07:44PM +0530, Manivannan Sadhasivam wrote:
> > > While I suggested to revert the link up IRQ patch for rockchip earlier, I didn't
> > > expect to drop the support for Qcom. The reason is, on Qcom SoCs, we have not
> > > seen a case where people connect a random PCIe switch and saw failures. Most of
> > > the Qcom usecases were around the M.2 and other proprietary connectors. There is
> > > only one in-house PCIe switch that is being actively used in our products, but
> > > so far, none of the bootloaders have turned them ON before kernel booting. So
> > > kernel relies on the newly merged pwrctrl driver to do the job. Even though it
> > > also suffers from the same resource allocation issue, this series won't help in
> > > any way as pwrctrl core performs rescan after the switch power ON, and by that
> > > time, it will be very late anyway.
> > > 
> > > So I'm happy to take the rockhip patches from this series as they fix the real
> > > issue that people have reported. But once the pwrctrl rework series gets merged,
> > > and the rockchip drivers support them, we can bring back the reverted changes.
> > 
> > FUKAUMI Naoki, just to confirm:
> > 
> > Neither my suggested approach:
> > https://lore.kernel.org/linux-pci/aRHdeVCY3rRmxe80@ryzen/
> > 
> > nor Shawn's suggested approach:
> > https://lore.kernel.org/linux-pci/dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com/
> > 
> > worked for you?
> 
> Yes, I re-tested the two methods mentioned above, separately, on v6.18-rc7,
> but neither of them resolved the issue in my environment (ROCK 5C +
> ASM2806).
> 
> > If so, I don't see many alternative but for Mani to apply patch 1 and
> > patch 2 from this series.
> 
> I believe applying patch 1 and patch 2 should be sufficient.
> 
> ----
> 
> Incidentally, (probably) while applying patch 1 and patch 2, I have
> encountered the following issue several times:
>

Do you see the below issue *after* applying the patches? I don't know how to
interpret "while applying".
 
> [    1.709614] pcieport 0004:41:00.0: of_irq_parse_pci: failed with rc=134
> [    1.710208] pcieport 0004:41:00.0: Unable to change power state from
> D3cold to D0, device inaccessible
> 

Looks like the device was seen during bus scan, but then it went down
afterwards.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

