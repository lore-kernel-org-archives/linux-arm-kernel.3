Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB281F30923
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hp29jnAJzUeQb6JgllraBvfvqxFaJdKR1N6ZWb40Qgo=; b=WgVtGtieaNoggZCw3zjjkLRLv1
	j37VmAeC0XS6vs88/dC+F7rSDyw/EzaUB75zI3XqTE4RB8o5zp7HU32nP473de0+F0YPkKtbQRIVz
	TC/N1GP8Ec/OuFBL5X3fCq91vHloU/btsbfS4hOh+FhepUIIZNWWv8HqUslHZBDhSjES6ZwdPShUG
	HQNeNX96Oe/dBIkL1/PzmAEhM+sbNO+RnMeswiM5keRuo4jxyzmHF2vjX2+AqVOcBvZMzttd9A3wG
	eC07NtSuasFxNuvQ7OmOdhpfnIuMhkBVzs3D/AUAjlAdBGNjM6i1y/SPuyOxbdznpr+qQugMHlqCd
	3boQ5g1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy52m-00000001ONa-0lMy;
	Thu, 05 Mar 2026 09:30:56 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy52k-00000001OMR-08U2;
	Thu, 05 Mar 2026 09:30:55 +0000
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 6EF351A090A;
	Thu,  5 Mar 2026 09:30:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id ABA5119;
	Thu,  5 Mar 2026 09:30:41 +0000 (UTC)
Message-ID: <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
From: Joe Perches <joe@perches.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Konrad Dybcio
	 <konrad.dybcio@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Date: Thu, 05 Mar 2026 01:30:40 -0800
In-Reply-To: <20260305085148.7cwo3yflp7vcfldf@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
	 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
	 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
	 <20260305085148.7cwo3yflp7vcfldf@skbuf>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: ABA5119
X-Stat-Signature: isin6ba55864u4k7cspzxagise7enff6
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+c/QqwBFj4RnbTOHAHP0u/fhPSDrZvfXg=
X-HE-Tag: 1772703041-391055
X-HE-Meta: U2FsdGVkX18CpOmWAsQNq/nzIGrueYMCLFpafncVkMPEeWn8lMHmxGid0nuFShmczpxd7LMIQ2HkJXitNrouaAWweblPom1aNWswKBKkaGGCen5irY0lnX3z9ty7T8amhD6qn9Q5wfYeFrX1AAy/tVHr70RJ5jxHv1CzpDKls395qE7TAifFzgOqcxBZ+LxnR/uVacI/Z8SiG+R8Q0lWc4dUv5BUq0HaFG5uC1dlHaBdlDEn65TIo3X5+7C0AcoUpQeypXp8sK9gp+VHT+vsBW/Ta2vT0Zqxi066+g9opvcn5emNN3z91009RwQ+r7ADwt/gmX2gmKTLfK9kac3enKskM+3ua1Jz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_013054_125886_B2628A00 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

On Thu, 2026-03-05 at 10:51 +0200, Vladimir Oltean wrote:
> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 55af015174a5..bdfa47d9c774 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
> > >  F:   drivers/phy/
> > >  F:   include/dt-bindings/phy/
> > >  F:   include/linux/phy/
> > > +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|o=
ff)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvd=
ata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|stat=
e)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)=
_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\=
.h|phy-props\.h|phy-provider\.h

You could use multiple K: entries instead of this monster.

And please use (?:<foo>) to avoid capture groups too.

