Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C989C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 04:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPfG3FnCj8t21Imaz+iRcuc2oJBUPOTz9xwgz75vhYQ=; b=lfQ8dFQAV6RVDg/UGgzaVsakgZ
	tXx80bnaY5GrT45ZnFPUejgK5zcgHM74Ju9c/bnI/u7cZP78hsFapV6a1pU5n7EAZr+cwJWNiUzdd
	hh5lZee/rHmIwKBpDnh5p16/SRvoDpfxKXk3bE1WpBkUTtWJrCaU2Bg1Twiul4pCZHGQ90DPM7xuZ
	JhhFIJ6uebb6WsAu64407ya+Zvn724pQr4hilxlbr6QGRENmikqURi1zNHXhTMySkxHFb8L9Yncpi
	pZrCokPZIniNoYw+frw4/Jqaxz9XQgnAFCYJ65erEGOkV9h9YuLg3ksw1ox8LDT9Iw9szidAw+xF9
	okSu4zPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRGF-00000003zoi-2m4L;
	Wed, 23 Jul 2025 04:39:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRDm-00000003zeF-2qMS;
	Wed, 23 Jul 2025 04:36:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB38741B32;
	Wed, 23 Jul 2025 04:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9522DC4CEE7;
	Wed, 23 Jul 2025 04:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753245408;
	bh=p74UQxL37h+qr7qVg6gSZ2EFfhn9ij8y2knb2vj/tS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1XN4AoV+19gzg+G2YbU+hc/5erT24ot/DxijuT5PquMvXxd0voSi4pYmNhYNYlay
	 tf+D35Tmv1hZ9SLgaHfsHMi0D//H90Ex3RKRvJH1PyTpQuIbkbkMQBq05sJlF6ANMx
	 24DT9D8dQEldXjTNMGs1qgOO9ztMvWu7BklOD6yol70cNf14MbdqLDFf05hQ1wufVL
	 lvS3gKMBL3nTvdQbIxF4hl4tvSiXp4IwZBL2V+sCCkBo5GTFe1joPPXqfntqFnFhGR
	 Kbugk5NGriYPyTexgIjzph/fXP7ywPccDyMzIapaH5XlwBc4DCKBDw5YeveLMNl1pt
	 OtqntMnO4l1CQ==
Date: Tue, 22 Jul 2025 23:36:47 -0500
From: Rob Herring <robh@kernel.org>
To: Erik Beck <xunil@tahomasoft.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2 v2a]: New board support,LinkStar-H68k-1432v1 (RK3568)
Message-ID: <20250723043647.GA1201956-robh@kernel.org>
References: <20250721201640.233818-1-xunil@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721201640.233818-1-xunil@tahomasoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_213650_738515_95290416 
X-CRM114-Status: GOOD (  12.92  )
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

On Mon, Jul 21, 2025 at 04:16:37PM -0400, Erik Beck wrote:
> Signed-off-by: Erik Beck <xunil@tahomasoft.com>

The threading of your emails is messed up. This is the only one in the 
thread. You need a commit messsage. Perhaps it can explain about this 
device/board some.

> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> index 5772d905f390..7f3904b69293 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -1109,6 +1109,11 @@ properties:
>            - const: rockchip,rk3588-toybrick-x0
>            - const: rockchip,rk3588
>  
> +      - description: Seeed LinkStar H68K-1432v1 RK3568
> +        items:
> +          - const: seeed,rk3568-linkstar-h68k-1432v1
> +          - const: rockchip,rk3568
> +
>        - description: Sinovoip RK3308 Banana Pi P2 Pro
>          items:
>            - const: sinovoip,rk3308-bpi-p2pro
> -- 
> 2.43.0
> 

