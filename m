Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4988C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwHOjyPcBjFJwUy1wg+Xz3IWBa+kx7JlzZt+oq/NInc=; b=tyMadk4V0TAgRTSlT+0MJSrX8P
	5Z4DgobhE5GzRlI2b6bzGjxs0XRQTAd3O+EFXEWTmOmImZl+0RsOYh5lS+vIiciSYlOoTNmQ2Lhdj
	GN8mHWA7L+3fIRzeCZI0vJDHvJ5w7bw8uEBOLHFz4VA4TR38qkB2TlzFPq8O79HQ+HmLpzVGJyUjK
	CiGH2MopUpfU30JQENBURF5v1IOjd/18OdoLX0ZoUkfaqib+2+bTnuDrTOh+83QEPw9wJApsy3baW
	rkMdEHYI7N8x2cOhP62Llr2WpIim5jrh2VEVvAxqx597zNt+7EGI5iKOXhC/xpPsvGhEbmpdrxshi
	vCWGi2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuowr-00000002UUw-0U1S;
	Fri, 14 Aug 2026 10:15:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuowp-00000002UUk-3LQg;
	Fri, 14 Aug 2026 10:15:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2597143B0D;
	Fri, 14 Aug 2026 10:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD691F000E9;
	Fri, 14 Aug 2026 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786702535;
	bh=mwHOjyPcBjFJwUy1wg+Xz3IWBa+kx7JlzZt+oq/NInc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FIqmu4aDSrKEH+ei+l9NY/L4Yjn7T8I0CLeqZ81qEbTNQAOm7s62Rz7Wx5vyyGdJi
	 oSpydOQ3VyiDimUK6hJtiSMyexBVgOBzXUwXelgTk/F8d+NhYFVMFa76cVp1H4yfaU
	 4rzqry5CvYED3LjxqCWlpPelIRkty+vAFsniGKbchN4WDk8JZ+r/g7CaF+wcMMCYt2
	 7WVAFv3gWq60azC2yj1Rqk4w6n1xzy/9n3f//b68vGVuDj65IJa38ZFmMwFQ9/2XEI
	 6l6T71Sq1cTycVp9r6RLKYGMRM3dXERDFFl5ACdDMhR+VWdDovbrlCIO2e6yP3k+bw
	 GU27jVw0OGGtA==
Date: Fri, 14 Aug 2026 12:15:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/25] dt-bindings: reset: Add RV1106 CRU reset
 definitions
Message-ID: <20260814-pristine-warthog-of-tolerance-4be5cc@quoll>
References: <20260810121121.210040-1-vlad@zlab.su>
 <20260810121121.210040-2-vlad@zlab.su>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810121121.210040-2-vlad@zlab.su>
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

On Mon, Aug 10, 2026 at 03:10:52PM +0300, Vladislav Leonov wrote:
> Add the reset ID definitions for the Rockchip RV1106 clock and
> reset unit (CRU), to be used by the reset controller driver and
> device tree nodes.

This goes with the binding/compatible using it, where is it?

Best regards,
Krzysztof


