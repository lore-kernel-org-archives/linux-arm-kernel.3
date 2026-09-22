Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4ACC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crnlWRGHzkiKnqsi+J52O4A2YeCGkswFEq9z794XHms=; b=l58ryAijzf3gnUKzVfnpldpsBW
	9XugkvOTTORp3wtVqgPpAOW43JrPf5sBjZGqenOZ6LLtFtLnML2Pq1m7lXHw1nNCVCjVRhKuktkqG
	+kjW9JU9eT9r4DqN6wUulyjBjYq5YIEbhIXd9kcb/t4Q+HdcFz/z2YnLxD6Xp8Ups+fzdrTO7J+yt
	0+R7UCtvN27S0iRQDEyss+abgHWS43kQjlavuQtfAet2HEE+GzZZj6Ie3czlQD/EJI8piq75QcdY9
	sXEqrHLKOO5Us3KmGXnKfwTpLOeCXcJolTXm5QrKaUivBySyt5H0DHxGZM/bL1euPZRJnBo37DR8V
	uwOzcgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ywA-00000005E9z-2ULx;
	Tue, 22 Sep 2026 11:45:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvq-00000005DtX-3Eza;
	Tue, 22 Sep 2026 11:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077504;
	bh=V3w3+8xXZ1Zb5lNKOebjguliwDwnSOWbcB2XO4qW0eI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MMdVKQMK6le7LIAa3HshD4GMWPejT+FRMh+dZ0zBVRFX0atXjll/DsBVm57t9xTH2
	 pmmbwqC/3zhTVafw97StE6baPzF9F68WJP4u9AdbZtFCQ80MEiykWRVI7Bas5rxcSc
	 TGuPSzD4Q6gvZ9kAT/Dgfco1RKS5sDi9ddG9uQBFajN1Ya6mX5PhEnYqpcZdu4Qx4Q
	 KvHqFwx/QBhZwTSWshJ0vhttboZKq+I4//xhkgRjSsxMOdyz0zDw0mBNAab3Nxgqw4
	 ts057oZ1MEfsjSaQQHZoYihTq06nklIg+UIzRynlhdvMty68tVmtt561lJ3WkgpdNV
	 idQcjvtK6foHw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE99917E06DB;
	Tue, 22 Sep 2026 13:45:03 +0200 (CEST)
Message-ID: <0982de65-9764-439e-bb4f-64034868aeb8@collabora.com>
Date: Tue, 22 Sep 2026 13:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: remoteproc: Fix MT8188 SCP regs
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260921232520.3127457-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232520.3127457-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044506_978060_09C1C4FF 
X-CRM114-Status: UNSURE (   6.06  )
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

On 9/22/26 01:25, Rob Herring (Arm) wrote:
> Allow single-register MT8188 SCP dual nodes with only the cfg
> region. Keep two-register and three-register requirements for the
> other MediaTek SCP variants that need SRAM and L1TCM regions.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


