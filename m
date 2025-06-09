Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24934C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BFjG+pOfRPDSRNc20uckkUnsRJat1xE+ocwboouqkvQ=; b=vrOJPTK4kEFT2A
	7N0pAlPBJuC+CMzAIjJ0Y+ahU2BlnM5BWcUo7wzgyXu4IsalkGxHUGxZ9oOIlCsvbWpm8byvfpMHl
	BGOz9raQOlckk3vNqDX4ScX51qXvcsO4mdaDBCraM5O6nJy1QlY5Z2v002+y18Z/sijL85Zyf7/kr
	/UsZHkCrNhIYD/Vfvqzy064oJwFlghp4UPUb2tD+Y7A2P3q/lOnE1iBi0zPnUi/HHE1o6PznUdAsZ
	ZX9AwMeEGgSL8O/eeD4CpZdO8GJhWbgokB2p7s2uAD0Hb/dfdHBmygBujfWlM1GJqE4C/NOsFF/62
	JCghqgvlUcCe5DzTPgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeIt-00000004VLG-3AMq;
	Mon, 09 Jun 2025 15:20:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdyh-00000004RQK-3DU9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:00:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-73972a54919so3668583b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481199; x=1750085999; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFjG+pOfRPDSRNc20uckkUnsRJat1xE+ocwboouqkvQ=;
        b=TUGzC06RSH1KfAjRoTQL0deMaoZCZjH1y7/OoQpRtQBF6EMM3wmJthsosbu3NDOEvN
         /L8fbv4tFXYV1ieWd6a5lHIh8CTLF1IYqmHN6RbyHwFZl9kQaqt8K5AQBTZGE99fGFIT
         bK8SNoOHNz1hf8Netw66gZiOHjm+wtAgDRhcrXH7Bzl1jdAZFfySL8ny8ekSeGFiaoxG
         9DVCBJjkhIa4DzYXeRNTGQekxlqiPb5CdyppHK656tm2gupKC9TcmhQumPlIq0wpZfDq
         37kfdS31tukNNy6gi6sHTZdXi0ef3eeoQ8K1CbGhCv1Qhza234Rr9debJ0Xqk+lg4p9M
         zKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481199; x=1750085999;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFjG+pOfRPDSRNc20uckkUnsRJat1xE+ocwboouqkvQ=;
        b=PwCKn7Hh+vBdukLcuyIjtCsSMP3xLx90+260ErtgE2cDDhKzbf2TouynwOi8KTSsWJ
         8YKksFT+7NLzVHNfH9j4s2MoVS/otmSyulJZPclyCntllJ0/bGd0Xz9CcLPOcnpRvDwU
         +VIjo1my3Ekorfkf71hu692KE0QFz/Ap3kPcJ+xTVkpRMQZCUyHEf0w/OQJTS7edA9rn
         r+IRHXzY4OotV5m4EDSHwVvDHkJDPNIp57lf707bOd1+At8F1+ale3YoquNd6pPypj7l
         j8sCzeokPUKIEd+FRLOZiQiOL9dln6c/TqEEtleTDVd5HlphXztZJXad+UBLVJ30YLvA
         Y46Q==
X-Forwarded-Encrypted: i=1; AJvYcCULvYu2U1Tx9Ji9brUVFL+0x7xwu7tsMnPbIlehOXyrZwtM9dSGRtzf3HjeQV/CXYif4iGsoHj9/FR46SFuWssQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzFA9VECC1zzhbPvUmmkPJuDzJkOobxRGavVhdOqNJSSzXcuY4v
	8hlUTMNDaum99kaqrOKu4/u1PCXyxnckl8Qxm/DohfWLb+4olPQSDYJr
X-Gm-Gg: ASbGnctMQvyEkWWnZjKTdAS4pW6msy6PI3Rul92Qfcr5jH/T4LfLgCF3mqX86mhxaKC
	/Wh9sqtok7aQZ7dGYcxGgMen4arWUyydVzNtzWdmWrgXd9WFF0u/tOmIb8NkYnP8IXhoBdRUXb6
	jVJCpy7ny7VG8LLlF/4d67kBQFN/Q+HkMTNjJXBIq/et+YLNg4z0yPzFfs4eh9MtjTbJEJXWfE2
	+8GPQFkkxZWvKxSXm3oc5fErbDQamazWjwkUYPM3QBrzvzsVg0U3APHEal21eVKK9tiTgie68ds
	Hl2mheQH1l1CXbJEP1nz5HnEoNnUt37VsYLKO+yuMBaV061RbVo6jDl50CR0zrut
X-Google-Smtp-Source: AGHT+IEZ8edEBrlsCKygg+nK6CspLV0qAaKPatEqxaD8M9wx4pHm3vwzRhBcGei/aNuSaxl7Obpv2Q==
X-Received: by 2002:a05:6a00:1caa:b0:740:596b:4a7f with SMTP id d2e1a72fcca58-74827f10b78mr15423924b3a.16.1749481199134;
        Mon, 09 Jun 2025 07:59:59 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.07.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:59:58 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/3] SPMI dt-bindings and nodes for Apple A11 and T2 SoCs
Date: Mon, 09 Jun 2025 22:59:39 +0800
Message-Id: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANv2RmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3RILA0NT3eKC3ExdC2OLpCQTyxRjk8RUJaCGgqLUtMwKsGHRsbW
 1AD8A8HRcAAAA
X-Change-ID: 20250527-t8015-spmi-838bb49d34ae
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=845; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=0JJhI6kqGvKy/FntRIN90GT+NgLZ4nMlsnsKmvnJqQU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbrh/dsfUqlx/OZukNJ815osELEASbfeSVkl
 2kMwpN8f5iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb26wAKCRABygi3psUI
 JCROD/9MdGwz06q2J5BkSI1sE4FjRBWgzH+YF25cFiPY7x30WY0fi8Qd9/X3ofOS1ToqDaYhvEX
 P+RR8W+NRhyzPOhP/O65qNaML/Z9LjL0A9RPLg6N6iV3PYqwjEnZm+32Sy2Pu4jj3o1+0x1rjZy
 5qly9YRCRQ812TBvLZlNP1YK2ISCw6ILoY6gUVwn22xhNlrsYqyIu+UG9suZ7bkJ7zWmZ+QC6bX
 mdAdMqaIUSo6e3ulpK31Uvi5JIdvAvMAfZkj2C7jZiDMr+u6+Xh+/g/yi0HUW834+e3jvXxi76k
 fS1HrHuucc5/Qwt/IKl7c1VOykSS7uCf9/4LLzo/pY32bQoT8QDt2sDHbY7DyQOjf6vD5YJKPmD
 GYhkSpqd+pbE8IRfn7xKbg8+QMPZxqPgSQDKJ3n+wdxHclKMHXL9M2m1ziYBcDLaB8kn8PnWOXt
 eNISMwePG/OS1VvqxjDS21ebGV+ZA7Jvj+5kqgEF8DvugoVJGPs5/fUoxmaLsd6NujZ3ulDPiEq
 klU/EeUOQkANrsCqEjRNIjEzZ16OMKG2vLM49JCAlBCPZVEL8N5S8x8riqfrrcj+A5bfFy2Y3Zm
 8GkqQHJSHNmuYhZaaOew3G2gKHRthX3RaEFjiBsC7w7lcewHZpMc2/4PYg+TkrJ0OCmpnjRVKBP
 9AGIZht0ca8wziw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_075959_809368_E3550C04 
X-CRM114-Status: UNSURE (   9.49  )
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

Hi,

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (3):
      dt-bindings: spmi: Add Apple A11 and T2 compatible
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 18 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-t8015-spmi-838bb49d34ae

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


