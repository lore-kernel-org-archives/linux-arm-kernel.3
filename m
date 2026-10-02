Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53721CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQDoPzEXeETyb5A+8w45tDo5texcaSJNAZPVI6AddNs=; b=N7wuX01+vsh+6YzDtoEbEvsUBE
	p+19NtcDD3z94BmGbG6fg7UMcW7uNd85Fuxe5tQxk5JMW0PG4xxDVTziBcZK1B3EQdV5AIUN51pq3
	dCxpZr0Kdii+KUxEbw7Cb1fxajfofHgEWRXRwGS9LR8vyT2czRIkqD1cjGyJFQ7NvmNExHMPmzUq5
	02KbEkcL+fyWdz3ZaNHcOCsD6aGXJTUbu/AStgk4IlB/91muFpLNl4TGc4FGXDFThpgLvUqiHLHYG
	xnN9YxjL4sz6coW/TEv0VgRPW2ZBR6rvrmSObTmlDSb1eZyhpymg/imyp99x0MMTiVEKqPwoXB0ve
	br1HFbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWoP-0000000AiyU-0VdX;
	Fri, 02 Oct 2026 06:32:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWoN-0000000AiyD-3DX0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:32:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E74C76021E;
	Fri,  2 Oct 2026 06:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A078E1F000FF;
	Fri,  2 Oct 2026 06:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790922722;
	bh=tQDoPzEXeETyb5A+8w45tDo5texcaSJNAZPVI6AddNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X2SyIKsioyLVTQm2BnWymFfQoJP8kTE5L6FW3BJ+yBXaFESdcdA4pLu6QX+Pb5yPt
	 WSUmiZUPysaF4VGqhMnCiZi4vnehk2LpCsogLEz3lneolB1VUYT/SkBPYW0GL93RQt
	 SfgqC5fUUM7NVKII3pdhPyNX0QaBwYt4Bv4p5Umqzv/OBuz9tIuohD496g+pqE8o4+
	 CDWxbq4Yp1OWeZhVYH90+W6ZI8OJnVAFzG5vR8U5kfgXrlIQtbQrgAD7Ucm3/ngcBD
	 gRCJdticJPE33FwHk+r8Fkrs10ATGGGaHiq+MtHEAAc4/34hz7/XHbcgrGi+9V5jQd
	 zdyjRzM6ZO6EA==
Date: Fri, 2 Oct 2026 08:31:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, afd@ti.com, u-kumar1@ti.com, 
	vigneshr@ti.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: arm: keystone: ti,sci: Add
 ti,tda54-sci-pdm compatible
Message-ID: <20261002-observant-prudent-booby-eac28e@quoll>
References: <20260930194131.117129-1-b-padhi@ti.com>
 <20260930194131.117129-3-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930194131.117129-3-b-padhi@ti.com>
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

On Thu, Oct 01, 2026 at 01:11:27AM +0530, Beleswar Padhi wrote:
> The previous TI K2G and K3 architectures were tightly coupled systems in
> terms of Safety and Security. All the TI-SCI messages from HLOS (Linux)
> were sent to a single sec proxy thread terminating at the core running
> Safety service (DM). In K2G systems, DM handled both Safety & Security
> requests by itself. Whereas in K3 systems, DM serviced the Safety
> requests itself, and forwarded the Security requests to core running
> Security service (TIFS) on the HLOS's behalf. This posed various
> limitations:
>    a. Increased latency: An extra forwarding hop through DM adds latency
>       in requests and responses.
>    b. Freedom From Interference (FFI) concerns: Having Safety service
>       proxy Security's requests (& vice versa) undermines the isolation
>       and FFI of the system.
>    c. Potential Deadlock Scenario: Forwarding messages between Safety
>       and Security cores can result in a deadlock if there are circular
>       dependencies.
> 
> To eliminate all the above limitations, the TI TDA54 class of SoCs
> introduce an architectural change: Isolation of Security and Safety
> services. To realize this enhanced isolation in hardware, two
> independent sec proxy threads are now provided for HLOS to communicate
> separately with the Security and Safety cores respectively. And the
> TI-SCI message forwarding has been eliminated in Software. The System
> Firmware ABI5.0 version necessitates this improved isolation and FFI
> change.

I don't get at all how above description helps to understand this patch
and this new compatible, except that this is not compatible with old
variants. So 30 lines of text instead of 3?

> 
> Add the compatible string for TI TDA54 SoC PDM system controller to
> support ABI5.0 communication protocol.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Note: This patch is independent and can be applied directly.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
>  .../bindings/arm/keystone/ti,sci.yaml         | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 67acce8a559a1..f0548382f7d52 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> @@ -20,6 +20,11 @@ description: |
>    initialized early into boot process and provides services to Operating Systems
>    on multiple processors including ones running Linux.
>  
> +  The TI TDA54 SoC, however, has two independent system controller instances - a
> +  PDM (Power and Device Management) system controller, which handles Power,
> +  Device, Clock, and Reset Management, and a separate SMS (Security Management
> +  Subsystem) system controller, which handles security services.
> +
>    See https://software-dl.ti.com/tisci/esd/latest/index.html for protocol definition.
>  
>    The TI-SCI node describes the Texas Instrument's System Controller entity node.
> @@ -40,6 +45,10 @@ properties:
>        - description: System controller on TI AM654 SoC
>          items:
>            - const: ti,am654-sci
> +      - description: |
> +          System controller for Power and Device Management on TI TDA54 SoC

That's redundant, you just repeated the compatible.

> +        items:
> +          - const: ti,tda54-sci-pdm

Why it cannot be enum with existing entry(ies)?

>  
>    reg-names:
>      description: |
> @@ -135,3 +144,27 @@ examples:
>          #reset-cells = <2>;
>        };
>      };
> +
> +  - |
> +    pdm: system-controller {

No need for new example which is the same.

Best regards,
Krzysztof


