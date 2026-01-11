Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCD1D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wr9BUD2EsKWYxLcYOUIrFPJntMmQbYJ0iMrn06ut0Y=; b=2a5d0OO0Jcl2dWQVZ8W4tsznnp
	gBdZQvkS9Kmwwu2RO692kvslFBFftMHjBrcfBXQbWeFM+Rd8LlMagz4UJYM84DS1hEAGFeGjUT2hR
	TQygu9haYpjq/0Qhnsgb1OEpaw2XTrlDdr3YAqKLwB7dxz5OtCsVnTrMOLXQf6cILHwHRydJmu4S9
	v/ru2Jdu70iqiHQPkddIu/xjlZyQ4/r0EzOoxsyuqQShD+kguIN3fJlvpb57EFbPuJDjQLba0kQgZ
	7muS1maVoEb1lvu/EwsOtqWdov6WXEq/ltUM5CxjiXedNMUF6cJCttAUaO/Yi9lk+o5P0eGByiXRE
	cEL810sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1verxO-000000045bM-3LJ4;
	Sun, 11 Jan 2026 09:41:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1verxO-000000045aG-13YH;
	Sun, 11 Jan 2026 09:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+wr9BUD2EsKWYxLcYOUIrFPJntMmQbYJ0iMrn06ut0Y=; b=HYSLeOnWoOJBhwbJ7GwDT4z6xr
	3cNSCUu5KIGfPvBM4/tz6stZAznAEce3Y5IV/7ml+07XLFXlZx/958okUqD4Nvqx72YZNAgYz7Im3
	2FxPaYcpKYkHfTjDkeqZPROTFoqCux7dqGPB1nR7sNGgFqyHTnHOMnBglYcHMrp7kYN8NHMR/yFJr
	xGstTtIKU4p7a47k9GBwKYUC8uAzxfrU4Y/nxgRrU3QG6Eewkd+SvnGctzUNz/S3wBLi6lmux9LJc
	VRUJiP2o59v+FyNMKeI83wLNcsKkKhmHSeNTM5FiFHn7hmHyNW7ew0Yf8CCNpCCcl2XGQhBaHcb3v
	SJBzMjyA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1verxG-0000000GyB9-43ja;
	Sun, 11 Jan 2026 09:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58954408F2;
	Sun, 11 Jan 2026 09:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F452C116C6;
	Sun, 11 Jan 2026 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768124505;
	bh=+TuUJhJ2yQsU60k2jmWlPomv8SG7G2UBq1YcJ30ostc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3sgumNEkLFv6olReQSEPNWaivLlKJr84QX6oc7VD2c9MCMzAHlkriDKjmNsolKlK
	 riRd35xrS4wGdjpi4DuGG6O0aG03qHKvHzUZNjhsjnXhhj9C7vmkZJ7R2q9QCLO781
	 o6caaz5gfwUZ0qRi0lRuXUcUab+YhyX+IQb8GVcrUpEnMfJ5+Kg24nASsxuB+3BcdT
	 QmITz8hhbfUwDNMKEQPC+xxd/d77OMDcgHywT35mK9WuLfLJlhMs7T+xQ5JFD8dkA0
	 YQ0XGFT7WizVkwO6lwi13XY9stE3bvP32d1M7Ng9JzxbD2zVmbJTYZa8JvnIvRbeuw
	 vm8pUzHj87dag==
Date: Sun, 11 Jan 2026 10:41:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marco Schirrmeister <mschirrmeister@gmail.com>
Cc: heiko@sntech.de, ulf.hansson@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: rockchip-dw-mshc: add
 rockchip,disable-runtime-pm
Message-ID: <20260111-melodic-chestnut-coua-73e6ec@quoll>
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
 <20260110010715.1610159-2-mschirrmeister@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260110010715.1610159-2-mschirrmeister@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_094151_660791_EDC8FECB 
X-CRM114-Status: GOOD (  16.90  )
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

On Sat, Jan 10, 2026 at 02:07:13AM +0100, Marco Schirrmeister wrote:
> Add a new 'rockchip,disable-runtime-pm' property to allow boards to
> inhibit runtime power management. This is required for boards like the
> NanoPi R76S where the bus timing becomes unstable if the controller
> is runtime-suspended during idle periods.
> 
> Signed-off-by: Marco Schirrmeister <mschirrmeister@gmail.com>
> ---
>  .../devicetree/bindings/mmc/rockchip-dw-mshc.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index acb9fb9a92cd..41f2644ca2ef 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -100,6 +100,14 @@ properties:
>        If not specified, the host will do tuning for 360 times,
>        namely tuning for each degree.
>  
> +  rockchip,disable-runtime-pm:
> +    type: boolean
> +    description:
> +      Inhibit runtime power management. This is required for boards

What is runtime power management? Like Linux PM? If anything phrased
like that is it is a clear no go. Bindings describe hardware.

> +      where the bus timing becomes unstable if the controller is
> +      runtime-suspended.

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.


Best regards,
Krzysztof


