Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56E3CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5GKFSb8/CEfXGsPeMSq9twJk4tF7yOdz4CDd5l/dKU=; b=TK5Ur3+nrrxVe83I3mtq1RN61d
	FA7BAZND1C8eYmmsmLV4aDqAW8qjxqKpKZD8tOc5e6yUP3gqy4GgvBQYrGWqtVGGLGfUl0CXBbd8R
	I6KVtkoh4Uegy9hEFDi7/Z9MNW+9nljceBgY28s6zavkm5zRyDt24tKfJyvqfmvVKx08E5Df09zXG
	Yhm5rBn2eMAVfi5GrDrF8XlFQJzwMVhxfgkYTiqIKC8pmqnw16PJ03QNsVSbg2KafAi3hg6W7xRDk
	IXCURviw1lfEkGzMa1eMfG/1kMCMBj4J7+1TaXSXQ25MpU+EwsJtL0UIFHMTnR8TfuhQ+3/F/A8FO
	5rPQZOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmLe-0000000CccP-2a3j;
	Mon, 20 Oct 2025 09:38:38 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmLc-0000000CcXZ-29nY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:38:38 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1760953090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5GKFSb8/CEfXGsPeMSq9twJk4tF7yOdz4CDd5l/dKU=;
	b=onWXANZnK+qqfixEuAceXS1lWRx+JeiaxMXIWo0ENGg8AfYu6LSCzWRujpeE3aJgRl1MKD
	5UYyN5Yu3LXWx0Pfe51SQNTWPgNGGwPlQub+f+qcMrlq1Ku3R9tK2sRXTOVmF5Y7wrAam9
	paPdawkWZi6FjgBdOrwdkMzsQGQdYngyKTiWWVdnTCPE3hdsVUg/YvhuwmP+ZP3RQ+kq6r
	a1dg7XBXJsQ+fAYnAyg3JrzuJLlaY24b5vin667/995YhHWgvY9Agftc09sFMPjGhnxV6M
	lEJLdbXKhmGgw7RyRLeRm+zJ5nHdrkUyOLVr8zM7RnWrXoWozQe3ocHOXkRZDg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 11:38:02 +0200
Message-Id: <DDN1RQB4LG0X.30F0A3IMJ4YI4@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <huangtao@rock-chips.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: Add support for rockchip
 pvtpll
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Elaine Zhang" <zhangqing@rock-chips.com>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <sugar.zhang@rock-chips.com>, <heiko@sntech.de>,
 <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>
References: <20251020023724.2723372-1-zhangqing@rock-chips.com>
 <20251020023724.2723372-5-zhangqing@rock-chips.com>
In-Reply-To: <20251020023724.2723372-5-zhangqing@rock-chips.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_023836_835119_2A117490 
X-CRM114-Status: GOOD (  15.72  )
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

On Mon Oct 20, 2025 at 4:37 AM CEST, Elaine Zhang wrote:
> Add pvtpll documentation for rockchip.
>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,clk-pvtpll.yaml   | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,clk-=
pvtpll.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.=
yaml b/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
> new file mode 100644

Should this file have the 'clk-' part in its name?
In a way this is different from the other DT binding files, but none of
the others have the 'clk-' part in their file name:

me@pc:~/linux/Documentation/devicetree/bindings/clock$ ls -lh rockchip,*
-rw-rw-r-- 1 me me 2,9K okt 20 11:32 rockchip,px30-cru.yaml
-rw-rw-r-- 1 me me 1,9K okt 20 11:32 rockchip,rk3036-cru.yaml
-rw-rw-r-- 1 me me 1,8K okt 20 11:32 rockchip,rk3128-cru.yaml
-rw-rw-r-- 1 me me 2,3K okt 20 11:32 rockchip,rk3188-cru.yaml
-rw-rw-r-- 1 me me 2,1K okt 20 11:32 rockchip,rk3228-cru.yaml
-rw-rw-r-- 1 me me 2,6K okt 20 11:32 rockchip,rk3288-cru.yaml
-rw-rw-r-- 1 me me 2,2K okt 20 11:32 rockchip,rk3308-cru.yaml
-rw-rw-r-- 1 me me 2,1K okt 20 11:32 rockchip,rk3328-cru.yaml
-rw-rw-r-- 1 me me 2,4K okt 20 11:32 rockchip,rk3368-cru.yaml
-rw-rw-r-- 1 me me 2,5K okt 20 11:32 rockchip,rk3399-cru.yaml
-rw-rw-r-- 1 me me 1,5K okt 20 11:32 rockchip,rk3528-cru.yaml
-rw-rw-r-- 1 me me 1,1K okt 20 11:32 rockchip,rk3562-cru.yaml
-rw-rw-r-- 1 me me 1,8K okt 20 11:32 rockchip,rk3568-cru.yaml
-rw-rw-r-- 1 me me 1,2K okt 20 11:32 rockchip,rk3576-cru.yaml
-rw-rw-r-- 1 me me 1,6K okt 20 11:32 rockchip,rk3588-cru.yaml
-rw-rw-r-- 1 me me 2,2K okt 20 11:32 rockchip,rv1108-cru.yaml
-rw-rw-r-- 1 me me 1,3K okt 20 11:32 rockchip,rv1126-cru.yaml

> index 000000000000..8be34bcde7b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,clk-pvtpll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Pvtpll
> +
> +maintainers:
> +  - Elaine Zhang <zhangqing@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - rockchip,rv1103b-core-pvtpll
> +          - rockchip,rv1103b-enc-pvtpll
> +          - rockchip,rv1103b-isp-pvtpll
> +          - rockchip,rv1103b-npu-pvtpll
> +          - rockchip,rv1126b-core-pvtpll
> +          - rockchip,rv1126b-isp-pvtpll
> +          - rockchip,rv1126b-enc-pvtpll
> +          - rockchip,rv1126b-aisp-pvtpll
> +          - rockchip,rv1126b-npu-pvtpll
> +          - rockchip,rk3506-core-pvtpll
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  rockchip,cru:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the main Clock and Reset Unit (CRU) controller.
> +      Required for PVTPLLs that need to interact with the main CRU
> +      for clock management operations.
> +
> +required:
> +  - "#clock-cells"
> +  - compatible
> +  - reg
> +  - clock-output-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pvtpll_core: pvtpll-core@20480000 {
> +      compatible =3D "rockchip,rv1126b-core-pvtpll", "syscon";
> +      reg =3D <0x20480000 0x100>;
> +      #clock-cells =3D <0>;
> +      clock-output-names =3D "clk_core_pvtpll";
> +    };
> +
> +  - |
> +    pvtpll_isp: pvtpll-isp@21c60000 {
> +      compatible =3D "rockchip,rv1126b-isp-pvtpll", "syscon";
> +      reg =3D <0x21c60000 0x100>;
> +      rockchip,cru =3D <&cru>;
> +      #clock-cells =3D <0>;
> +      clock-output-names =3D "clk_isp_pvtpll";
> +    };
> +
> +  - |
> +    pvtpll_enc: pvtpll-enc@21f00000 {
> +      compatible =3D "rockchip,rv1126b-enc-pvtpll", "syscon";
> +      reg =3D <0x21f00000 0x100>;
> +      #clock-cells =3D <0>;
> +      clock-output-names =3D "clk_vepu_pvtpll";
> +    };
> +
> +  - |
> +    pvtpll_aisp: pvtpll-aisp@21fc0000 {
> +      compatible =3D "rockchip,rv1126b-aisp-pvtpll", "syscon";
> +      reg =3D <0x21fc0000 0x100>;
> +      rockchip,cru =3D <&cru>;
> +      #clock-cells =3D <0>;
> +      clock-output-names =3D "clk_vcp_pvtpll";
> +    };
> +
> +  - |
> +    pvtpll_npu: pvtpll-npu@22080000 {
> +      compatible =3D "rockchip,rv1126b-npu-pvtpll", "syscon";
> +      reg =3D <0x22080000 0x100>;
> +      rockchip,cru =3D <&cru>;
> +      #clock-cells =3D <0>;
> +      clock-output-names =3D "clk_npu_pvtpll";

rockchip,cru line as the last line?

Cheers,
  Diederik

> +    };
> +
> +...


