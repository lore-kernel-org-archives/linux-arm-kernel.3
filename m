Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD21CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0va9/EyMjKMurKnEoNlMlsGNtwpMnvTh5eZELuACqr4=; b=K0sD/Tx7+H68kaKnB6jb6urizX
	GxQJwx0EVb0UBLtQwCwRK5/LFtndza2JWHNVisaIaQqFPylazJPQwo3ygPVxMd3FdumhUm1ozQgwf
	oLNhIaccKvKXwpGPE479odf/1A/51tAyHGTUz4lYwoX2csBCVsP0xSS1Oe6dsmFe0GK3rUTsZ92IB
	KgA/NsVNmV6Kj/RM/bj+hWnII6YYwUT+KDl7oPavQ/eTSVn/yhtgPV6Tb4CBJd6HCtL+76KgAMa4k
	FOvpDfJb6Qc2koPgQTKHt9gPShKvxoClPYXYvL71It0ZQ3WvTVMviPm5oEse4aSBOrPXENjBdsdnU
	O/gDKkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lNc-000000096Yy-0uyH;
	Thu, 25 Sep 2025 12:47:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lNa-000000096XX-2lao
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 12:47:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 199EB60556;
	Thu, 25 Sep 2025 12:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E82C4CEF0;
	Thu, 25 Sep 2025 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758804441;
	bh=0va9/EyMjKMurKnEoNlMlsGNtwpMnvTh5eZELuACqr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uB2kh8MekoL4HrWbZoaCpxvMyS1CQqAccAKQLSC7vRrWXOMJHeDiNACXwxOwivuTW
	 k3PdEOhRVEhcJddTgo0imo10Qrbgx92Ya+Qwv+W5FVLML7ADPkvFA02EylFVCuWB5n
	 mTPYIbssgGiVYtsmdxhUXe7BjENkH+JfAh6lwk5hGAU0P7m3KPH7D5phcZ/WLfKVuw
	 DwTQ8+Qrvnbt6p15pI3dJygeAvm8Ec8NqUrCIMyIVDS8umoAbGf33wrqBXZeLvYD2+
	 auia77sI9GhXZzMfG9BA1xVLeyxjNLUKnpE8jFXFSXczpx5uMpOhtaRcOitj40Yu29
	 64XJzoeE/aNWw==
Message-ID: <9d1bc76e-9070-459b-bb83-92aed2fc8e0c@kernel.org>
Date: Thu, 25 Sep 2025 13:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
 <P5tG63fZnyrHYqzybjhoOpgXBlJQHT92Z3VjYNKDSMpfjuZsHZ1_QlpibvJLNKH5mvMsoZeFGDqCKJJb6gpvcg==@protonmail.internalid>
 <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 25/09/2025 09:44, Taniya Das wrote:
>> This is not a revert.
>>
>> Where does the compat string go ?
>>
> The compat is now part of
> Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml as part
> of this commit "842fa7482915".
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

