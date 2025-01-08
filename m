Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9317AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 04:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoDly0E4x23Zqec9V/1wlO/Nn3vQQ5Y5K9yB0bMLY7A=; b=qmbRQoOClfuF9hHOsqywDS7nlR
	ridrGS7A9/bxFNXu0EAs3uax+0LO2A3it9Jiij/MWYYqeX5Vx+1QVYIhTwiS3WJiNWJyxESUAKIXo
	MgzY1h1+ae82xJmDzEMQlXzn5pzUAlfouvp44tWb4IlU3Ddj8loIC3Pj90ud55zn83sgMblmqtSw7
	Cj6rqN4IxnciwEmY3j1Ir8ydF2OjcS5Z5mNEeFtqAZxIee9XE6ZvsEmEHfcOaR0hWyZ8vBAxbSkPo
	GCel1ljlQF70nEt+hs+Nn3ioT2fxtWAUmcOqL5zt2RXp0wIe2God6Vk/EBjiu5ze3EIIQQ/4JfJUq
	5ECg3mvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVNwM-000000078B3-3ZQP;
	Wed, 08 Jan 2025 04:45:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVNv9-000000077v3-2aaf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 04:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BF775C49DC;
	Wed,  8 Jan 2025 04:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366B6C4CEDD;
	Wed,  8 Jan 2025 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311434;
	bh=/mV7wH7LOMq7MCH8cH9ae72/1BoyFaiEHE7/iGDin2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0tQEHwQMyRBv1ZkdEIyczcnBERy1sWANseSDlSiUG0Iujcsia52vIhYr/3pO8tjl
	 G3eCOtSxU/WgZwwgVRBJWC1+Ik+nGRLqQfErZkIseVoCA9wp4bVFhbjnFdE/03euaK
	 k0heRncyrsPB+ZGTd7bztzan/nLsDgxbJhPr0JQKatzln/jGcSi6MwbVvTX+CWyJ9w
	 /ehKVm/EYP4lERGDzuHiZNt3KRxeqAQYOI0Eo6LB7aumlef/7w2x+N9qzpGikowCu1
	 6q3rjRCLU/YGIU2R0XhCyu2KYiJ/R+MjCMelcOD0aVMcWfMKwqfUXut5wE/sJP8y0T
	 9ls+leud6dNPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] arm64: dts: qcom: sm8450: Add coresight nodes
Date: Tue,  7 Jan 2025 22:43:43 -0600
Message-ID: <173631142067.110881.6694902504537302147.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20240927095413.15278-1-quic_jinlmao@quicinc.com>
References: <20240927095413.15278-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_204355_699739_C40FDD71 
X-CRM114-Status: UNSURE (   7.57  )
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


On Fri, 27 Sep 2024 02:54:09 -0700, Mao Jinlong wrote:
> Change since V4:
> 1. Use ^ete(-[0-9]+)?$ for the pattern of node name -- comments from Krzysztof Kozlowski <krzk@kernel.org>
> 2. Update commit message --- comments from Rob Herring <robh@kernel.org>
> 
> Change since V3:
> 1. Use ^ete-[0-9]+$ for the pattern of node name -- comments from Rob Herring
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sm8450: Add coresight nodes
      commit: 6e8637db89bf138a0533b5442d9a0b02afa5e3e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

