Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41703E68974
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oe43Kh4B9XdXa2/L1UGOstz1oF9OEnFJnRe/vKUWKos=; b=vIM6v4fEDCUZzTO8sFoQSx7+Ut
	eNtSSZuKDjAqPu2qvw5Zli/AEVzsies9JPTWU0xP0a0vEbG2dt/4Mf6jRfgokIDp4ivwxzPS8/R1p
	A1GC5/3XhODQKJzEC1Zn54lcBmKRHtOUpL6uNgpgGeo0aR2ZSt8eWoNlj2ji5uPqXoVQeay80voxv
	LTinCkL78GimuiZJvKdE7HdH8Lw8174fpLZRaaA2qsJ4tVzc6Vxa3U2xMwfbW/2ILxln3lHNLfgra
	V+8uA/bnJty0L2ywjPW4tR+pmykmQqv2mOlalht2DkepMrlL4pK9GQpIK9BocvXdXuuieLfz4hoRI
	7m0Gwl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Sun-00000003Kdb-2TsQ;
	Thu, 31 Oct 2024 11:00:33 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Srn-00000003KJm-0GYh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 10:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730372242; x=1730977042; i=wahrenst@gmx.net;
	bh=Oe43Kh4B9XdXa2/L1UGOstz1oF9OEnFJnRe/vKUWKos=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QUPUarGHgVFTVsiLY13LnTToitIe2pgfpZ4MVz6awnTutfJav4grv9hdFzlhkLI7
	 6KUlCNiwhH2hMx2Tf6SvfpgI29DRdCBZ/8NGLPgBGo9Q7Voyww8k0n28ljp3q4GSh
	 UD3NRPa6r9g5nc1TBoFeOX1Aamn9r0U0SHT5nHOcPxSe+PFoW+OjyDElpdhY7Enc+
	 wWQtX+3e4uj3KrmAbfC8MJVf82HRvxAmUUhcZ8tkE8uExS8r3SPVyHJb3KOrWJGRf
	 vhaNJvSSLZXNqzdibnZQOdiGSMuzmUJcqpkr9VjR4+dq4kGHwolwYrs+jk6x4q8/h
	 W1TPjpMMhy+sYAhZHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnaof-1tXnPT3BEj-00b0fY; Thu, 31
 Oct 2024 11:57:22 +0100
Message-ID: <0cb1e74f-1163-4a80-8c62-9c7b0a0584f9@gmx.net>
Date: Thu, 31 Oct 2024 11:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241022133040.686562-1-lukma@denx.de>
 <20241022133040.686562-4-lukma@denx.de> <20241031094236.17ed927d@wsk>
 <806770fc-3830-4e89-a3ee-487b662685ed@gmx.net> <20241031113425.1e3d1da5@wsk>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241031113425.1e3d1da5@wsk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ueq9WGiK3ZelpdLiptJjxXUfOP7Gd+Bcvs9yr/VNBq6j/n/wyhW
 x1d4gEzBdNf3tkwbHyCvbWI3H1NPx/+plxVFWb6RkqsLFDpHvv7PZq2eRhBeP+1kQcYjbRK
 joQDLID2XsBhsOlRA6hDiPcakKic59Fp3cOq4Vi8PoqYBEFQnU99U9aV2yK3X/nzAd2rA7D
 h2uYGjAtBBAdAs8XnWDXQ==
UI-OutboundReport: notjunk:1;M01:P0:iMKkQEY8APg=;lkIqyhmfxxDZI8/qbIw/RDKfkak
 7KBbBqxD+sNYzxnIiFVC3XmZQ77p2KO2aMm4p47FW9dcWNnGow/0QrJfPK9Fbd5Gen12HKcv4
 lwX94A7pWBsK466ZvRlCInjRaF3ra7muYBcfXxbqM5lgDZQ3NCER38Eh3Ngb7Tyo4LBRg/WPf
 bzDnS+d1dZxlovad6bLx7man/UYZUsEwsbQ1xOH0hwTvLPG+fMkkkwFQWEr0m3IHfHMqZAcVX
 Kj/Wv0PsuB3yEkxgd7NRGKa7avZYHsBY0ccxg7pb2o+mPK7phdxo+sjrbCEvEqMB8LuCSfIWo
 uzj0QmaGDeGE0SDFp1VZAGWre4D/SXzFFINI8f4nn8OBw8hTVioE2UklkkAQjY5yET/XLh1QS
 2wkk+wdkd5uu3++QBfePWrNuuV3pu0F+V6yfpHXuA4SD6QnDQN+AS2bCB/54BundiVhKv+oeb
 d9RwFbrrqUTZvqdBGSrkCxedZtKKV9JBpM1PiDVyUCdHP0fK3wmi+bumP+hMrYK5esHE+lJSR
 k4LRB2/C7ynQRVYrBflUBE6opSeDaAm92GL5/HjMIyk6mn6pBFzpYLooJG9ytRKGt4RflTMB9
 uSgyo8+4/BnqIhOq/eCFV4lT2LOFRqhpYXodEXl1P6zSWtlLHdAqlpGhVLatnIU9sa9B3TMJA
 ean4aO/Hhb8LEfPqBV2LJOddi3Wcs/Dsn5N/HnTJ5Fq2Th9jQUhQsWd/MlIhPR0sVzGzzT7D4
 12nGXGczhuiKUY8D91BVV61W0q9iArRyTx7JL+76da6H2zjmF66sYtZEFb0M+abKdZRXPgFnC
 jMUPCYq1aJp0FkVpdoILlqwA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_035727_523530_88984D1F 
X-CRM114-Status: GOOD (  19.53  )
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

Hi Lukasz,

Am 31.10.24 um 11:34 schrieb Lukasz Majewski:
> Hi Stefan,
>
>> Am 31.10.24 um 09:42 schrieb Lukasz Majewski:
>>> Dear Community,
>>>
>>>> The btt3 device' HW revisions from 0 to 2 use imx287 SoC and are to
>>>> some extend similar to already upstreamed XEA devices, hence are
>>>> using common imx28-lwe.dtsi file.
>>>>
>>>> New, imx28-btt3.dtsi has been added to embrace common DTS
>>>> properties for different HW revisions for this device.
>>>>
>>>> As a result - changes introduced in imx28-btt3-[012].dts are
>>>> minimal.
>>>>
>>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>>>>
>>>> ---
>>>> Changes for v2:
>>>> - Rename dts file from btt3-[012] to imx28-btt3-[012] to match
>>>> current linux kernel naming convention
>>>> - Remove 'wlf,wm8974' from compatible for codec@1a
>>>>
>>>> Changes for v3:
>>>> - Keep alphabethical order for Makefile entries
>>>>
>>>> Changes for v4:
>>>> - Change compatible for btt3 board (to 'lwn,imx28-btt3')
>>>>
>>>> Changes for v5:
>>>> - Combine patch, which adds btt3-[012] with one adding board entry
>>>> to fsl.yaml
>>>>
>>>> Changes for v6:
>>>> - Make the patch series for adding entry in fsl.yaml and btt3
>>>>
>>>> Changes for v7:
>>>> - Use "panel" property as suggested by the community
>>>> - Use panel-timing to specify the display parameters
>>>> - Update subject line with correct tags
>>>>
>>>> Changes for v8:
>>>> - Use GPIO_ACTIVE_HIGH instead of '0'
>>>> - Add the comment regarding mac address specification
>>>> - Remove superfluous comment
>>>> - Change wifi-en-pin node name
>>>>
>>>> Changes for v9:
>>>> - Remove not used 'pm-ignore-notify'
>>>> - Add display names for 'panel-dpi' compatible to avoid Schema
>>>> warnings
>>>>
>>>> Changes for v10:
>>>> - Drop new line with panel-timing definitions
>>>> - Add new lines with 'sound' node
>>>> - Change 'codec' to 'audio-codec'
>>>> - Change order of properties for saif1 node
>>> Are there any more comments regarding this patch?
>> Sorry, i wasn't aware that you are waiting for reviews after Rob's
>> request.
> I did not received any mail from Rob's automated DTS test script, so
> this is a good thing :-).
I meant his comment to patch 2 V10. This patch "depends" on the binding.
>
>
> Best regards,
>
> Lukasz Majewski
>
> --
>
> DENX Software Engineering GmbH,      Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de


