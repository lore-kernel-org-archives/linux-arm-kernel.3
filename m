Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E3ECD585E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CglZm0Bx0vloewTjIpSITntSyRCFjdmTE/x+ud8hzXQ=; b=MYmrdIaFQeS6FmdonFPRkTOhcF
	r27uLytQi+LJtJYeNztzn2aLyausG19Bse3uFHLI9bNjY4qiCATHZyNch+rrTsCvI1c9Nu0iLS/nx
	Y+aZrjiUW5EX5nKOv7xLioqu/+6v+WZPYThoUKs1p3wpBz5+vFcTr6linW4caHf7dufOMdCmxrKVF
	H+4hBE0Wq7OXIv3EgcPq+nUf6RSQ01v9ob48qKEgIJlwpH8VL3aop7qx6nBfzbN21zVDIvZyhRyjw
	/C4+uzdJWk4VHEb3fVHEYaEMCrL2XitmXCdqdmVoVTnV9Wy9rqsliv2lMb0ugxStnwBpp1gbKgH/r
	oylIDYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSOz-0000000Esbb-36nt;
	Wed, 07 Jan 2026 12:12:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSOw-0000000EsbF-3oSC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:12:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607BkYUW1642747
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 12:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CglZm0Bx0vloewTjIpSITntSyRCFjdmTE/x+ud8hzXQ=; b=Fo6e4NzIcMR0k+UP
	dYRj0xCalJw56YEttQyeT5CbSBcrRLDNRycqgwnXrn3jhnbY3rhYD1UCuPEp6ocQ
	BDqTV1s4bUal2pnvyfn3irAj711AqpP4AUM8qcSu3ir+S924HtHGI/FsQ5sCMBZO
	VZ8fzBpiFuP8M1ynUu+Ih7uaVlw57QLQR2wFzJDrnWce+j18Exh4M/6oCfCSOHX8
	Wo3RvRYB+itS/9vfGnrpcUlByOkV66+K5EFGIbhd2MoWe4tYbPQeOMef1WjHJQVK
	1wNxhg+hlYL5nXZJ9QkucueGiLzmiQmMnV2iDN1QwNGCe52uLXKMcgOkYNm05UEE
	O7qZuQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfhbbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 12:12:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so57243821cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 04:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767787952; x=1768392752; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CglZm0Bx0vloewTjIpSITntSyRCFjdmTE/x+ud8hzXQ=;
        b=WNjw4IuYpqMHs8FlKTpDlW4x7pUQGupx6zo1wJwu9qQmet7k8LIvd3Rr8KzGvXWSWL
         00Mj9Mv68VpmEaGLVoFCIFO+C2SB3cqZ+1lDUmN/f95I/EkksXQajY134recn1RYw8jX
         +GNbJI3PF3XD3fN7dpWJTHtgF6AR1QSczx4RNPPBnG6TuAbcqEJHGECGX531b7MHSL+H
         WRT6LrIVIrHzUdqdta2PUC1kyfq0xxSUiWwZKVGP2zPRQTCDElWQxAkRuSW9YRsZ/4ue
         ckoTADWyTFC6tDhAbFPQ4mZ2Vy8/W9Mt5PNInPMNV3xP7n+5mVJQSv99tR8kFCaSDhky
         Ua0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787952; x=1768392752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CglZm0Bx0vloewTjIpSITntSyRCFjdmTE/x+ud8hzXQ=;
        b=l963ia4oJKKXckNgYqdgw4XrTn6S9kTa5SZFYZ29TLST+9TDXxChL8RfGLeFDUCx1E
         1eNo0AZ28DE1k/xn4Zcwk5fwhQyUwTQpehZ4yZHDyLQ5BhRBsrpAYQzKp7ALtQwDuyEk
         pyXLJrI/pfDNPCpCSF+W3hGIt05Th5LqB4VI+ijzSNIjdIbh6vgd/LgBIlmma3aM/48Y
         iLz8ESGaxaPBfu1VQ+bRgMjgQI9WI60Zs60IVTaOLRm1g4OWBHvIFh+nFuofSTbv0RBG
         4JqbtHrQKQIGfcym5810ON2GaIFe51snFs6A1iG6D4wfmrw5ewwtW0uCn+gqeWWcrvLJ
         gfbw==
X-Forwarded-Encrypted: i=1; AJvYcCVw0cICMJxsPpN6BpWvFcQilw+HtJuQCN1Dkp6C0QntaQKkymHHV1vs9+BcqcfFD6zLn/x98Xl8EN8csaIFY9Pt@lists.infradead.org
X-Gm-Message-State: AOJu0YxPkhlDnMZB/kAaK46fp9BA6PwqNbaXZspOHrhQMoMR/lJZQug1
	2mqEQWcdULzsZemWhIS/E+/ZPupVCG0xgWXmUyb5u79yft3djJrIndHkCU53yUNTmM4ofWElPU8
	UwFvrKIlwKNGmSNEWVBZkprj6ZL9gjix1jU2W9aAKLMvquCmgwQWVwgt9TKLuKs2EnQyecTqbL6
	yi3g==
X-Gm-Gg: AY/fxX7HFMqQJuqNr35DoKd7+6zXjQ72ZYIwBF6heXrk3f/DzCMlIb9LtjhvCoR7C3T
	o7p8aRCTuLvId2fsv3tTr2MCWUrka4LD/+/SBa8klWlZDdEozX8cldL3BY/ekRh7d8JzCcTUohP
	OgToCN+rNtXr8tPgKeRH2zVp3hSqWZ/kd9xO3VJeCPT3yx3jdqv9LTaEX+Iz9auNxRklCBKPEv6
	rC6bk7EwNf4SykvNnRKrPNJtAsIeqdaXzkON0AfHMRCMb5wsmP1/D4MeprZ2R6CEQsetlxhswEp
	Bgs7zJW7VoRU3SJMws2gUqgQGww/XekgzQ/y92Jh1VwXft12wbtkznifVe1CQqJL1Au6z/LIVsW
	OJgoF9YJFiQfSf0CdDOtn2NPaf2ogc98RmGCpoWwjxYeuHqDnAkfh/DdUBFZZ4S7qb6ErNl6Gb3
	fG5ZMSEviLKPdrf6A/ug3Ehn8=
X-Received: by 2002:a05:622a:5916:b0:4f3:59a7:67b3 with SMTP id d75a77b69052e-4ffb48c4709mr28503031cf.20.1767787952356;
        Wed, 07 Jan 2026 04:12:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2A3iR7hDKHrT8sGDdbHZBXbjLAGksj23v1DrOVBJA4EhIdUY291ne567GafOnCt1i9gA9ow==
X-Received: by 2002:a05:622a:5916:b0:4f3:59a7:67b3 with SMTP id d75a77b69052e-4ffb48c4709mr28502701cf.20.1767787951887;
        Wed, 07 Jan 2026 04:12:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea814sm1289794e87.12.2026.01.07.04.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 04:12:31 -0800 (PST)
Date: Wed, 7 Jan 2026 14:12:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
        Mika Westerberg <westeri@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Message-ID: <p4fwvwbhwbdpiqvspjq4stjyuxy5pqvdei3wfianw4aeujmgbx@utumnrffangf>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <fimuvblfy2cmn7o4wzcxjzrux5mwhvlvyxfsgeqs6ore2xg75i@ax46d3sfmdux>
 <uc7utm7tbtmkk6osaoydibd5evtpm246sjrpkx3lpclpk4srea@a4g65oduswau>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <uc7utm7tbtmkk6osaoydibd5evtpm246sjrpkx3lpclpk4srea@a4g65oduswau>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NCBTYWx0ZWRfX4uYlByfLWj0h
 MPfvjqFUNrPmtSDKFEOSELbZM18L/kAJZ323EgiXHMARi6Itdb0uBf/p2SfTebcZwP0uCz4ciDm
 zeVhfV0mtFU0p8nxtY5FQ3TtfU84ZyonNAgH6LBss8+/rO7oCDocioO2Ur06Uhor//hjpCd9ZuW
 ZzoIoAoL5DKNNHB8XdlOMglZ8Q4VolCvk/kJ9ZR2DsnfuscUNxkitZe8TjKqmcUy+I4roiQCRTF
 Ev5B+w4YZa/cB6sCHY0eBxwVClDLTFI98HKMwsPfPKV1biqJ+jtrFPSuL1ZdDLx3Eroq1u+DIh5
 sUR3Kq0uPnr7FZlU6jXYWQJv6z76iWbXPEk+vRnUyG1JfkRs7XwbwiB2VGoM4leaL+0/ZNOD8+z
 WBNHC77e5Dts4E+08tSBGszb/CGFL4k8d+EBFLKG5WZeqvgn+SXZz6ooLv5pYs5Z/EtkK1rtdeD
 GoJ/xU9pvW+2/g0aL1g==
X-Proofpoint-GUID: SSebSYlAKEKa1ICmxwQWzioCRk5dtv3K
X-Proofpoint-ORIG-GUID: SSebSYlAKEKa1ICmxwQWzioCRk5dtv3K
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e4db0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=sWqkpiAQKYQcFBEJubgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_041235_096773_23649C9A 
X-CRM114-Status: GOOD (  50.54  )
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

On Wed, Jan 07, 2026 at 05:17:09PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Nov 26, 2025 at 06:27:13PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Nov 12, 2025 at 02:55:29PM +0100, Bartosz Golaszewski wrote:
> > > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> > > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > > this series however impacts Qualcomm platforms. It's a runtime dependency
> > > of patches 8 and 9. Would you mind Acking it so that I can take it into
> > > an immutable branch that I'll make available to Mark Brown for him to
> > > take patches 8-10 through the ASoC and regulator trees for v6.19?
> > > 
> > > Problem statement: GPIOs are implemented as a strictly exclusive
> > > resource in the kernel but there are lots of platforms on which single
> > > pin is shared by multiple devices which don't communicate so need some
> > > way of properly sharing access to a GPIO. What we have now is the
> > > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > > doesn't do any locking or arbitration of access - it literally just hand
> > > the same GPIO descriptor to all interested users.
> > > 
> > > The proposed solution is composed of three major parts: the high-level,
> > > shared GPIO proxy driver that arbitrates access to the shared pin and
> > > exposes a regular GPIO chip interface to consumers, a low-level shared
> > > GPIOLIB module that scans firmware nodes and creates auxiliary devices
> > > that attach to the proxy driver and finally a set of core GPIOLIB
> > > changes that plug the former into the GPIO lookup path.
> > > 
> > > The changes are implemented in a way that allows to seamlessly compile
> > > out any code related to sharing GPIOs for systems that don't need it.
> > > 
> > > The practical use-case for this are the powerdown GPIOs shared by
> > > speakers on Qualcomm db845c platform, however I have also extensively
> > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > configurations.
> > > 
> > > I'm Cc'ing some people that may help with reviewing/be interested in
> > > this: OF maintainers (because the main target are OF systems initially),
> > > Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> > > in audio or regulator drivers and one of the goals of this series is
> > > dropping the hand-crafted GPIO enable counting via struct
> > > regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> > > to also cover ACPI (even though I don't know about any ACPI platform that
> > > would need this at the moment, I think it makes sense to make the
> > > solution complete), Dmitry (same thing but for software nodes), Mani
> > > (because you have a somewhat related use-case for the PERST# signal and
> > > I'd like to hear your input on whether this is something you can use or
> > > maybe it needs a separate, implicit gpio-perst driver similar to what
> > > Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> > > last week in person and I also use the auxiliary bus for the proxy
> > > devices).
> > 
> > Hi,
> > 
> > I'm sorry if this was already reported and fixed. On Qualcomm RB5
> > platform with this patchset in place I'm getting the following backtrace
> > (and then a lockup):
> > 
> 
> On Rb3Gen2 this breaks UFS:
> 
> 	ufshcd-qcom 1d84000.ufshc: cannot find GPIO chip gpiolib_shared.proxy.4, deferring

CONFIG_GPIO_SHARED_PROXY=y ?

> 
> But MMC acquired the GPIO successfully,
> 
> 	sdhci_msm 8804000.mmc: Got CD GPIO
> 
> But I can see gpiochips registered as well:
> 
> (initramfs) ls /dev/gpio*
> crw------- 1 0 0 254,0 /dev/gpiochip0
> crw------- 1 0 0 254,1 /dev/gpiochip1
> crw------- 1 0 0 254,2 /dev/gpiochip2
> crw------- 1 0 0 254,3 /dev/gpiochip3
> crw------- 1 0 0 254,4 /dev/gpiochip4
> 
> Let me know if you need more info.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
With best wishes
Dmitry

