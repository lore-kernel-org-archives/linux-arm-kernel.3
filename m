Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EE8C02184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0Qrzgg2ua23heO+J/1apVMe+JOEnRWPI3Yz+eSCuMc=; b=TIKXJ/qMqdPabq/zAD1VIw5Y0w
	6NznkhX5dSCeYBlIisXje9X6OESTu55rkrUUxPFYvFoK6mELK5+dUOoQD4tAqStIzet1HxxIegnFi
	J8JsLz+MuoHnN7Toa5JxeeG5vd16ET4+kekiDP3z7Cth0w9Q/cjBbO0c6g3RO5GNYVhYaslg/r0Ui
	KR+shirA7BO6qTXuSZsZgS7IAPR/qnyVyXqHruHW7AsXxvdXyTdCrkPJozqhEFHLQ4rmqbqgGMPsm
	x3YNxFzt/XiX0WLAJ9lXblccf7ndw1gHJzr9lSHj82slDOCEpuTmcoVW3tmFf0e35f/wayIrqWQLi
	ipm21k4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdvc-000000083Oq-1lUt;
	Tue, 14 Jan 2025 10:13:44 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXduN-000000083E1-1JGy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:12:28 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54021daa6cbso4652666e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736849545; x=1737454345; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c0Qrzgg2ua23heO+J/1apVMe+JOEnRWPI3Yz+eSCuMc=;
        b=Qq0bAvujd/zsPBro7TIP9h7znAMENQspSS4gO+DLdTgna/FYtmYxMVwBDH63p3C788
         XTwaupUZKTOgNBs3wNf8vv5Xa5+IPOpk0JjtWDzadtYlgyDojfX3suhNU9P1ymCb0ebI
         NtF5DJZcAXWfX3VO2ILAV3K/ij/Rzd41IV9gx39l7pClzZNoY1gsRa0zCK7ck3MHfiSQ
         5145gIx80BQ5eTMkyA6efxqWI7zFyyn00pgwGuFjtOCBw27lj6spiPG58byPD8d0RYF3
         bDdGL/z73mzwqY8f2h8e+wOWzA3Fpk6Yrg7CRoL1C2+W4gNw0fBbsfOaliYryFPqyB0C
         4pLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736849545; x=1737454345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0Qrzgg2ua23heO+J/1apVMe+JOEnRWPI3Yz+eSCuMc=;
        b=agalmeLjBhdmpDNGUhAd4O3VkomN+MXkvliX/h7GizLi+094TRS7iGqG4UOU3Jm17k
         7CYp2QSvGyyvz3v1ozj5MTn1twQFwzuNYmogcPr+mg/iGQ896gnRVL6tS0fpQNBITXY1
         SZRbTMrxgyGiaj9j6Gr7lCGEUul9Wto6BKNP0A147+K43UND/A8bqLpNiE0KxQn/rZcI
         mw614uwJvqMGgDhmSoc1t4oxcQoGODed4Hai/11yhMhf74OXGFuSmA89bCejeeoguPo0
         LDaPC5eKXbjc8xx1NGF4MN9Pc7ZqegWcOCi17iuRck+pU3Vppb7wiyMoccmr1B6LVm4x
         heIA==
X-Forwarded-Encrypted: i=1; AJvYcCUwRiGC8mv8R4MTnRIfaZP4uHvljZxs5lSgK/SyILHdopdoY+roRw96jRMjdvbs9c45Th6ndI/mWt473O0bwT3f@lists.infradead.org
X-Gm-Message-State: AOJu0YxzqwbnUzbt0nFzuD0SLr/q2/rCl9nIZXeN21cOhfFdVX1goh3L
	gzxj50+sOrXkI0vf4YeTIossIw8rmrL3sY2RH/b4wFMO2NauUnB76XUs21ufADs=
X-Gm-Gg: ASbGncv2Q3Be8ZTv134ho8UxoDJfBtuOnlVbIVl7DU1WI5XImOtd9t8PD31sE+5PYjf
	dztcqfbt70YHdnH5qyjtpCwdXAcloEV3vxQfAAH7Lg8iJ7b2UpFEHGhN6P1ueZeBFSFYZoXSF8H
	P+4j3uDZNMC9t8HVrvO7S/VXbKj9VISd1G6PVb6MSlfMMIQk/wI4KQujnKuvOBcER5oU1HRxMo4
	Fnig/rkbetJQcv8E4F5JO68jwmwNXVpr3MqQhlTnSFIAVHI51N8O5U6Il+EDAJsgrE8OiH8UOwR
	oEknxsYpuG4t7IrjcwA5G0EVlUcC6N95FF2v
X-Google-Smtp-Source: AGHT+IGvwMKyxTPc6XYDYWpAagsTLJobLBRBIaI1VJFHrDhlbJEBvgyteqb/2DjPirIxW8WefT3Djg==
X-Received: by 2002:a05:6512:31c9:b0:542:7217:361a with SMTP id 2adb3069b0e04-542845af299mr7698904e87.10.1736849545347;
        Tue, 14 Jan 2025 02:12:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49f0bsm1625315e87.36.2025.01.14.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:12:24 -0800 (PST)
Date: Tue, 14 Jan 2025 12:12:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Message-ID: <a42wtus7y72mt5adklbwg2hjbuayxkeucs7t4xuzmxyag2mx7b@6wlsomzj4gha>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_021227_351716_C49081A8 
X-CRM114-Status: GOOD (  15.86  )
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

On Mon, Jan 13, 2025 at 01:52:08PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> binding definition for the PHY driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,sm8750-tcsr.h>

This a typical comment, please actually update your internal
documentation: don't use GCC's and other clock controller's bindings in
examples for other blocks.

> +
> +    usb_1_hsphy: phy@88e3000 {
> +        compatible = "qcom,sm8750-m31-eusb2-phy";
> +        reg = <0x88e3000 0x29c>;
> +
> +        clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> +        clock-names = "ref";
> +
> +        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +        #phy-cells = <0>;
> +
> +        vdd-supply = <&vreg_l2d_0p88>;
> +        vdda12-supply = <&vreg_l3g_1p2>;
> +
> +    };
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

