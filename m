Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8915DE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Ogyv9dYy/EGd8xF//2I0QWHEwpZ/rDlMG6I+W2ypJuQ=; b=n/uqYqQqPr+87I
	ldeW6aYcgK6scXt2wCUIG9GcDWeV1e8p80x23xY/Zuo0kv0wvLEnnE5kMh8CLQu+RaM5qdqD1rwLa
	OFAPFiRojKTjOGMGZawZ3AnsIm771EXDFtptEx6WZ9cbmF64GVur8crdz+6LVRht8sje/o8Qv+RFz
	5H8b8e8CcC3nLS/sNFcz+6QNZszT7vIRQtVCMQQd7+qVht/d6bRcxbyAYuKlyObkv9nQCzbjhxCxt
	lV5dSCE+61z43vq0oDyvm0E0JQ0xnAjneJGvUzlWkH6kwbzKHY/u5BgfsN26qAjXOcU74g5k65547
	/NEf7dZqnvXD6zF8armQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFg4-0000000GxPV-3dZX;
	Thu, 05 Dec 2024 17:30:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFZJ-0000000Gvul-3scO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA65A5C6BD2;
	Thu,  5 Dec 2024 17:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C484C4CED1;
	Thu,  5 Dec 2024 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733419392;
	bh=fi2WY3gBh65WYtY2fRxW1m7CZSc00650cfNmqqUnA18=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=N0ziBbO/Al108sgzgpgfqlBHui/9lVvto/OgeBeezQS2smZibRfyFkaN8yazfWTy/
	 cEkEQTw3Fbupk5EJG3IejmoW5HBwAJJFUSc6fW/p9AHQ53kkSDp9wTlZpmD0xdNY1p
	 3cSnOtR/P4D70ZVo9Tu+C72eD4uGGr5co+aG+GpFvXB/vKreQntGU0zE6EOKjQLiX6
	 Y1aWDK8wXTHZsrxqEqFmKZBeWgaoJov5ut0ZtF4cXXgoaCic2mgR3d6Lx6TshMec/f
	 vXNqjKMtAxBa7DyyeNupzOqD8qd8jIeQfjkDhamsBTx8eDzwcPMITuA/7pxI3RrYku
	 zHHlNpSFiy7rA==
Date: Thu, 5 Dec 2024 11:23:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
Message-ID: <20241205172310.GA3055111@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-2-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_092314_029410_EF65AD26 
X-CRM114-Status: UNSURE (   7.59  )
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

On Tue, Nov 26, 2024 at 04:51:15PM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode.
> ...

> +        power-domains = <&CLUSTER_PD>;
> +    };
> +

Nit:

  Applying: dt-bindings: PCI: Add STM32MP25 PCIe root complex bindings
  .git/rebase-apply/patch:163: new blank line at EOF.
  +
  warning: 1 line adds whitespace errors.


