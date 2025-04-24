Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF01AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnsJEopH+F/MteZj6mWG5Rud/5A8NdQcGngZtW0jt5k=; b=dBkYyv4AavicxHpLFVwnvtoH60
	xqItLxrJIuVRP+/gNX+H8eCYJwpexuaA3gBTtr1ZIDiTidcFIOqXHCRIBzqn60cYiu4i+J5QBaUEH
	5qujzTEgUYMUlfQC05IsEBJckWPzQW58hT4nJS9J7k4ojTkRNLscaiv2w6d26Xh2QU8hA4UlqbwmQ
	D1YLy/w5UFPkZDF83nETMJ0PzjKVtMSMnozSJci6wksA0DkPLd4eDJEO5qtp6o2hrGiOjOsOT6epv
	NrwzTim53o3bljZI9Q6K08x+qXq1PVHTztJU73sqPENd9TKDBU6UbxV14hfUpV/KOyk6UYeCXtnU+
	vufTbd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r6Z-0000000DCTw-3PTf;
	Thu, 24 Apr 2025 07:34:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r4Y-0000000DC9Z-2fGy;
	Thu, 24 Apr 2025 07:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B645CA4A852;
	Thu, 24 Apr 2025 07:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65A9C4CEE3;
	Thu, 24 Apr 2025 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745479957;
	bh=UXUhPaNtMk1R10Wyxi4MJA+gxXMW3VzEBTRBlFMNNlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUAu1y4ZS1rReflpqiqcIN7UnNIzLnab3hyFdHbWsnfk+sesWnE+cnjI71LJ2ul7z
	 Txo6iwxJWGfe3H6ghAxwT7/PnMWRR1rTO50jVNZ/75faGyo9IFUA9XP2aIF1Ne7F3O
	 5CRIxgl24EvfPD9kT3I1EJORhClYqukaQN2TE/T2FpFkh8Z7KPucdXIqA5f3znsAft
	 c66S1jwjfoWNY0oIVs42CfUy77VvxmAUI/8lVQvBTYj5Rpulxfu9oNvtgHOrMLM//n
	 n76pHNLmcC3Q/CsqtMM0Y1UBha6tpmg7TXSsfd62OOCmdHm4duiD4qy6VFW+891Ilv
	 9mkV0EBI4odrw==
Date: Thu, 24 Apr 2025 09:32:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
Message-ID: <20250424-masterful-original-python-8dafb0@kuoka>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-3-25c79ed01d02@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-3-25c79ed01d02@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_003238_734884_CD3C5B5D 
X-CRM114-Status: GOOD (  11.06  )
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

On Mon, Apr 21, 2025 at 03:00:10PM GMT, Melody Olvera wrote:
> SM8750 does not require an XO clock in the dt as it is the
> parent of the TCSR refclk_src, so move the compatible to a section
> where the XO clock is not required.
> 
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


