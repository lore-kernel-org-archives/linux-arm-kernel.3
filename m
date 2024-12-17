Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A38E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80hq5UlyfMPq9lLW6IHF93i21x4mkYbezwQcwT3PU3w=; b=hyCwslz7qVfCkVXGCJEtUaAASZ
	lqlrsNxE+OQVyxQCPs6h9eoX5lp9HIKUjuIKQdHdYWqLOhdbInlHjjkoZZDWT0C285+vlTb6KbX2+
	ZOw9YyFrdMzCm9k1ZvlmVkBcxUAJF+8VSqIco8yFGBZYXo0ORzKQkT/B7HUNFPUDx659bGDEWr+EN
	IGNcjlgDWo7ufera6P6afp/RZLJgUuEB5bku+SrCKtGGlcL0mGq6qUTi/60OXNxRVzDT2396Yi0QB
	DnLUjAkFG2G698o1Tsok7c1PD346QoxWigfOlYUwtSXdA9wRLdStXFZgeqPjDX0DQ7Xu0cVS2RW6Y
	rJp4k4VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYjs-0000000DnJD-1ZZS;
	Tue, 17 Dec 2024 14:39:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYgh-0000000DmZO-0rpy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:36:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44EE5113E;
	Tue, 17 Dec 2024 06:37:03 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC5B93F58B;
	Tue, 17 Dec 2024 06:36:32 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Tao Zhang <quic_taozha@quicinc.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v7 0/4] source filtering for multi-port output
Date: Tue, 17 Dec 2024 14:36:25 +0000
Message-Id: <173444598114.864570.18416527651218850484.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213100731.25914-1-quic_taozha@quicinc.com>
References: <20241213100731.25914-1-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_063639_341923_A2E0A0AA 
X-CRM114-Status: GOOD (  12.98  )
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

On Fri, 13 Dec 2024 18:07:27 +0800, Tao Zhang wrote:
> In our hardware design, by combining a funnel and a replicator, it
> implement a hardware device with one-to-one correspondence between
> output ports and input ports. The programming usage on this device
> is the same as funnel. The software uses a funnel and a static
> replicator to implement the driver of this device. Since original
> funnels only support a single output connection and original
> replicator only support a single input connection, the code needs
> to be modified to support this new feature. The following is a
> typical topology diagram of multi-port output mechanism.
> |----------|     |---------|     |----------|   |---------|
> |  TPDM 0  |     | Source0 |     | Source 1 |   | TPDM 1  |
> |----------|     |---------|     |----------|   |---------|
>       |                |                |             |
>       |                |                |             |
>       |      --------- |                |             |
>       |      |                          |             |
>       |      |                          |             |
>       |      |                          |             |
>    \-------------/ ----------------------             |
>     \  Funnel 0 /  |                                  |
>      -----------   |     ------------------------------
>           |        |     |
>           |        |     |
>         \------------------/
>          \    Funnel 1    /     ----|
>           \--------------/          |
>                   |                 |----> Combine a funnel and a
>                   |                 |      static replicator
>           /-----------------\       |
>          /    replicator 0   \  ----|
>         /---------------------\
>              |     |      |
>              |     |      |-----------|
>              |     |---------|        |
>              |               |TPDM0   |TPDM1
>              |            \-----------------/
>              |             \   TPDA 0      /
>              |              \-------------/
>              |                    |
>              |                    |
>              |Source0/1           |
>           \-------------------------------/
>            \           Funnel 2          /
>             \---------------------------/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom,coresight-static-replicator: Add property for source filtering
      https://git.kernel.org/coresight/c/2a0bc219272b
[2/4] coresight: Add a helper to check if a device is source
      https://git.kernel.org/coresight/c/62374ce1876b
[3/4] coresight: Add support for trace filtering by source
      https://git.kernel.org/coresight/c/ec9903d6cc34
[4/4] coresight-tpda: Optimize the function of reading element size
      https://git.kernel.org/coresight/c/56e14a21cee4

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

